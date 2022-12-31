#!/bin/bash -eux

# Move odd and even displays to the correct outputs when monitor is connected/disconnected (triggered through kanshi)

# Before we start moving workspaces, keep track of the currently focused
# workspace so we can focus on it once we're done.
orig_workspace_num=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

# Iterate through each workspace and move to the correct display
for workspace in $(swaymsg -t get_workspaces | jq '.[] | .num'); do
  target_output=$($(dirname $0)/get-workspace-output.sh $workspace)
  echo "Moving workspace '$workspace' to output '$target_output'"
  swaymsg "workspace number $workspace ; move workspace to output '$target_output'"
done

# Focus on the original workspace
swaymsg "workspace number ${orig_workspace_num}"
# TODO: would be ideal to focus on the most recently used workspace on each
# display, or re-focus on each workspace in LRU order.
