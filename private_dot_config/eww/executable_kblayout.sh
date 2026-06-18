#!/usr/bin/env sh

set -eu

# Cycle list. Each entry is "layout" or "layout:variant".
# Edit this to add/remove layouts.
LAYOUTS="us:intl fr"

current() {
  setxkbmap -query 2>/dev/null | awk '
    /^layout:/  { l = $2 }
    /^variant:/ { v = $2 }
    END {
      split(l, la, ","); split(v, va, ",");
      lay = la[1]; var = va[1];
      if (var == "") print lay; else print lay ":" var;
    }'
}

label_of() {
  printf '%s' "$1" | cut -d: -f1 | tr '[:lower:]' '[:upper:]'
}

apply() {
  lay="$(printf '%s' "$1" | cut -d: -f1)"
  var="$(printf '%s' "$1" | cut -s -d: -f2)"
  if [ -n "$var" ]; then
    setxkbmap -layout "$lay" -variant "$var"
  else
    setxkbmap -layout "$lay"
  fi
}

case "${1:-get}" in
  get)
    cur="$(current)"
    label_of "${cur:-us}"
    ;;
  next)
    cur="$(current)"
    next="$(printf '%s' "$LAYOUTS" | awk -v cur="$cur" '{
      n = split($0, a, " ");
      idx = 0;
      for (i = 1; i <= n; i++) if (a[i] == cur) idx = i;
      ni = (idx % n) + 1;
      print a[ni];
    }')"
    apply "$next"
    label_of "$next"
    ;;
esac
