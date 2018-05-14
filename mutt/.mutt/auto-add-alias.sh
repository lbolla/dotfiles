#!/bin/sh

MESSAGE=$(cat)

NEWALIAS_ROT13=$(echo "${MESSAGE}" | grep ^"From: " | sed s/[\,\"\']//g | awk '{$1=""; if (NF == 3) {print "alias" $0;} else if (NF == 2) {print "alias" $0 $0;} else if (NF > 3) {print "alias", tolower($(NF-1))"-"tolower($2) $0;}}' | tr a-zA-Z n-za-mN-ZA-M)

if grep -Fxq "$NEWALIAS_ROT13" $HOME/.mutt/aliases.rot13; then
    :
else
    echo "$NEWALIAS_ROT13" >> $HOME/.mutt/aliases.rot13
fi

echo "${MESSAGE}"
