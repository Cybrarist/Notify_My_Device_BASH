
#!/bin/bash

while [[ $# > 1 ]]
do
  key="$1"

  case $key in
      -r|--register)
      KEY="$2"
      shift
      ;;
      -t|--text)
      TEXT=$(sed 's/ /%20/g' <<< "$2")
      shift
      ;;
      *)
      ;;
  esac

  shift
done

if [ -n "${KEY}" ]
then
  # Save APIkey to ~/.notifymydevice
  echo "${KEY}" > ~/.notifymydevice
else
  KEY=`cat ~/.notifymydevice`
  curl \
  "https://www.notifymydevice.com/push?ApiKey=${KEY}&PushTitle=Notification&PushText=${TEXT}" \
  > /dev/null

  echo "Notification Sent"
fi
