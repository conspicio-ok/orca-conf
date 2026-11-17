#!/usr/bin/env bash

outputs=$(swaymsg -t get_outputs -r)
mapfile -t internal < <(jq -r '.[] | select(.active and (.name | startswith("eDP"))) | .name' <<<"$outputs")
mapfile -t external < <(jq -r '[.[] | select(.active and (.name | startswith("eDP") | not))] | sort_by(.rect.x) | .[].name' <<<"$outputs")

mapfile -t visible < <(jq -r '[.[] | select(.active)] | sort_by(.focused) | .[] | "\(.name) \(.current_workspace)"' <<<"$outputs")

screens=("${internal[@]}" "${external[@]}")
n=${#screens[@]}
((n)) || exit 0
free=$((9 - ${#external[@]}))

pairs=()
ws=1
for i in "${!screens[@]}"; do
	count=$((free / n + (i < free % n ? 1 : 0)))
	for ((k = 0; k < count; k++)); do
		pairs+=("$ws ${screens[i]}")
		ws=$((ws + 1))
	done
done
for out in "${external[@]}"; do
	pairs+=("$ws $out")
	ws=$((ws + 1))
done

existing=" $(swaymsg -t get_workspaces -r | jq -r '[.[].num] | join(" ")') "
cmds=""
for pair in "${pairs[@]}"; do
	read -r num out <<<"$pair"
	cmds+="workspace number $num output $out; "
	[[ $existing == *" $num "* ]] && cmds+="workspace number $num; move workspace to output $out; "
done
for pair in "${visible[@]}"; do
	read -r out num <<<"$pair"
	cmds+="focus output $out; workspace number $num; "
done

swaymsg "${cmds%; }"
