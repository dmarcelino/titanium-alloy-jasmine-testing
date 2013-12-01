#!/bin/bash
 
usage() { echo "Usage: $0 [-b]" >&2; exit 1; }
 
while getopts ":b" opt; do
  case $opt in
    b)
      echo "Building titanium..." >&2
      titanium build -p mobileweb
      ;;
    \?)
      usage
      ;;
  esac
done

phantomjs --web-security=no --local-to-remote-url-access=yes tests.js
