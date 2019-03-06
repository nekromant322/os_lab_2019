#!/bin/bash
ans=0
for param in "$@"
do
let "ans=ans+param"
done
echo "$(($ans/$#))"
echo "number of arguments $#"