#!/bin/sh

airport_path="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

if air_info=($(eval "$airport_path" -I | grep -E "^ *(agrCtlRSSI|state|SSID):" | awk '{print $2}')) ; then

  rssi=${air_info[0]}
  state=${air_info[1]}
  ssid=${air_info[2]}

  case "$state" in
    "running" )
      if [[ $rrsi -le -100 ]];
      then
        strength=0
      elif [[ $rrsi -ge -50 ]];
      then
        strength=100
      else
        strength=$((2 * (${rssi} + 100)))
      fi

      if [[ $strength -ge 75 ]];
      then
        airport_="#[fg=colour36]#[bg=colour36, fg=colour0] ${ssid} #[fg=colour0] ${strength} %"
      elif [[ $strength -ge 25 ]] && [[ $strength -lt 75 ]];
      then
        airport_="#[fg=colour214]#[bg=colour214, fg=colour0] ${ssid} #[fg=colour0] ${strength} %"
      else
        airport_="#[fg=colour203]#[bg=colour203, fg=colour0] ${ssid} #[fg=colour0] ${strength} %"
      fi
    ;;
    "init"    ) airport_="#[fg=colour226]#[bg=colour226, fg=colour0] ... " ;;
    *         ) airport_="#[fg=colour1]#[bg=colour1, fg=colour0] ✗ " ;;
  esac
  echo "#[bold]#[default]${airport_}"
  fi
