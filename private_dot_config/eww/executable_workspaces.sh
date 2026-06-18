#!/usr/bin/env sh

set -eu

ORDER_JSON='["1","2","3","4","5","6","7","8","9","0","music","teams"]'

i3-msg -t get_workspaces | jq -c --argjson order "$ORDER_JSON" '
  . as $workspaces
  | ([ $workspaces[].output ] | unique) as $outputs
  | def ws_state($ws; $out):
      (first($workspaces[] | select(.name == $ws and .output == $out)) // null) as $entry
      | if $entry == null then "inactive"
        elif $entry.urgent then "urgent"
        elif $entry.focused then "focused"
        else "active"
        end;

  reduce $outputs[] as $out ({};
    . + {
      ($out): (
        [ $order[] as $ws
          | ws_state($ws; $out) as $state
          | select($state != "inactive")
          | if $state == "urgent"
            then "(button :class \"workspace-btn urgent\" :onclick \"i3-msg workspace \($ws)\" \"\uf0f3 \($ws)\")"
            else "(button :class \"workspace-btn \($state)\" :onclick \"i3-msg workspace \($ws)\" \"\($ws)\")"
            end
        ]
        | "(box :class \"workspace-list\" :spacing 2 \(join(" ")))"
      )
    }
  )
'
