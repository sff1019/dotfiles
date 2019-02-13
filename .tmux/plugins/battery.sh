#!/bin/bash

if battery_info=$(/usr/bin/pmset -g ps | awk '{ if (NR == 2) print $3 " " $4 }' | sed -e "s/;//g" -e "s/%//") ; then
  if [[ -n $battery_info ]]; then
    battery_quantity=$(echo $battery_info | awk '{print $1}')
    if [[ ! $battery_info =~ "discharging" ]]; then
      battery="#[fg=colour233]#[bg=colour233, fg=colour36, bold] ⚡︎ $battery_info $battery_quantity %"
    elif [[ $battery_quantity -lt 16 ]]; then
      battery="#[fg=colour233]#[bg=colour233, fg=colour1, bold] ♥ $battery_quantity %"
    else
      battery="#[fg=colour233]#[bg=colour233, fg=colour36, bold] ♥ $battery_quantity %"
    fi
  fi
  echo $battery
fi
