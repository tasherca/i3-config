#!/bin/bash

# Получаем список всех рабочих столов и их состояние с помощью i3-msg
workspaces=$(i3-msg -t get_workspaces | jq -r '.[] | "\(.num): \(.name) \(.visible)"')

output=""

while read -r line; do
    num=$(echo "$line" | cut -d':' -f1)
    name=$(echo "$line" | cut -d':' -f2)
    visible=$(echo "$line" | cut -d':' -f3)

    if [ "$visible" == "true" ]; then
        output+="[$num: $name] "
    else
        output+="($num: $name) "
    fi
    
done <<< "$workspaces"

echo "$output"

