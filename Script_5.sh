#!/bin/bash
#Set the message to be sent
msg="Dear user, please remember to do your assignment in order to develop muscle S"
subject="Reminder"

#List of Users

users="larryck1 larryck2 larryck3 larryck4 larryck5"

#My domain
domain="Nodel. 24910.auca"

#My email
mymail="larryckontsandaga21@gmail.com"

#Send the reminder email to all the users in the list
for user in $users; do
  
  #set the address email of the users
  address="$user@$domain"
  
  # Send email to each users using sendmail
  echo -e "Subject: $subject\n\n$msg" sendmail $address
  echo "Reminder email sent to $address"

done

#Send the email to myself using mailx
echo "$msg" | mail -s "$subject" "$mymail"
echo "Reminder email sent to $mymail"
