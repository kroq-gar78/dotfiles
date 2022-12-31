#!/bin/bash -eu

# Determine which output a workspace should be on, based on connected displays

curr_workspace_num=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')
workspace_num="${1:-$curr_workspace_num}"

num_displays=$(swaymsg -t get_outputs | jq 'length')
laptop_output='eDP-1'

# Before we start moving workspaces, keep track of the currently focused
# workspace so we can focus on it once we're done.

if [ $workspace_num -eq 9 ]; then
  echo "$laptop_output"
  exit 0
fi

if [ $num_displays -eq 1 ]; then
  # Laptop display only
  #echo 'Laptop display only'
  echo "$laptop_output"
  exit 0

elif [ $num_displays -eq 2 ]; then
  # Laptop display + single external display
  other_output=$(swaymsg -t get_outputs |jq -r '.[] | select(.name | startswith("DP")) | .name')

  if [[ " 1 3 5 7 " =~ " ${workspace_num} " ]]; then
    # Put odd workspaces on the laptop
    echo "${laptop_output}"
    exit 0
  elif [[ " 2 4 6 8 10 " =~ " ${workspace_num} " ]]; then
    # Put even workspaces on the monitor
    echo "${other_output}"
    exit 0
  fi

elif [ $num_displays -eq 3 ]; then
  # Laptop display + two external displays
  readarray -t other_outputs < <(swaymsg -t get_outputs |jq -r '.[] | select(.name | startswith("DP")) | .name')

  # If this display is found, it's the primary display.
  if [ ! -z "$(swaymsg -t get_outputs |jq -r '.[] | select(.model == "DELL S2721DGF")')" ]; then
    primary_display=$(swaymsg -t get_outputs |jq -r '.[] | select(.model == "DELL S2721DGF") | .name')
    # This seems like the easiest way to reliably remove an element from a list.
    # Can also filter out within the jq query itself (instead of using grep).
    readarray -t other_outputs < <(swaymsg -t get_outputs |jq -r '.[] | select(.name | startswith("DP")) | .name' | grep -v "^${primary_display}$")
    other_display=${other_outputs[0]} # just choose the next display
  else
    primary_display="${other_outputs[0]}"
    other_display="${other_outputs[1]}"
  fi

  if [[ " 1 3 5 7 " =~ " $workspace_num " ]]; then
    echo $other_display
    exit 0
  elif [[ " 2 4 6 8 10 " =~ " $workspace_num " ]]; then
    echo $primary_display
    exit 0
  fi
fi

echo 'Fell through all cases without matching a config. This is not supposed to happen.'
exit 1
