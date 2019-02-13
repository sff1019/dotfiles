#!/bin/bash

if battery_info=$(/usr/bin/pmset -g ps | awk '{ if (NR == 2) print $2 " " $3 }' | sed -e "s/;//g" -e "s/%//") ; then
  battery_quantity=$(echo $battery_info | awk '{print $2}')
  if [[ ! $battery_info =~ "discharging" ]]; then
    battery="#[fg=colour233]#[bg=colour233, fg=colour36, bold] ⚡︎ $battery_quantity %"
  elif [[ $battery_quantity -lt 16 ]]; then
    battery="#[fg=colour233]#[bg=colour233, fg=colour1, bold] ♥ $battery_quantity %"
  else
    battery="#[fg=colour1]#[bg=colour233, fg=colour36, bold] ♥  $battery_quantity %"
  fi
  echo $battery
fi
