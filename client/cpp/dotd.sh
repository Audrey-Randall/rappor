#!/bin/bash
#
# Usage:
#   ./dotd.sh <function name>

set -o nounset
set -o pipefail
set -o errexit

# From:
#
# http://www.gnu.org/software/make/manual/html_node/Automatic-Prerequisites.html#Automatic-PrerequisitesR
#
# We are putting this in shell, so we just have 'sed in bash'.  Not an unholy
# mix of 'sed in bash in Make'.

main() {
  local basename=$1
  local in=$2
  local out=$3
  sed "s,\($basename\)\.o[ :]*,\1.o $out : ,g" < $in > $out
}

main "$@"