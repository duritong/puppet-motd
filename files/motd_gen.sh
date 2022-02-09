#!/bin/sh

if [ -x /usr/bin/figlet ]; then
  /usr/bin/figlet $1
else
  /bin/echo -e "$1"
  /bin/echo "---"
fi
/bin/echo -e "$2"
