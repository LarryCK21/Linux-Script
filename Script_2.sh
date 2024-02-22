#!/bin/bash

#set the limit
Limit=20

#Get the storage usage and store it in a variable
usage=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

#Get the hostname
host=$HOSTNAME

#Check if the usage exceeds the limit
if [ $usage -ge $Limit ]; then

  # Set the Subject and the Alert message
  sub="Alert root Partition usage on $host exceeds $Limit%"
  body="Root partition usage is currently at $usage%. Please take necessary action"
  
  #Define the email of the admin
  To="larryckonstandaga21@gmail.com"
  
  #Send the email to the message to the admin
  echo "$body" | mail -s "$sub" "$To"
  
  #Check if the message was sent successfully
  if [ $? -eq 0 ]; then
    echo "Mail sent successfully to $To"
  else
    echo "Failed to send Mail. Retry"
  fi

fi

#Set the Alert message for the SMS Message
msg="Alert root Partition usage on $host exceeds $limit.\nRoot partition usage i s currently at $usage. Please take necessary action"

#Send the The alert message to the admin via SMS using textblet APi 
curl -X POST https://textbelt.com/text --data-urlencode phone='+250785511304' --data-urlencode message="$msg" -d key=textbelt
