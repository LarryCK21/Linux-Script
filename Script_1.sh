#!/bin/bash

#Add username and set a password for the users 
for (i=0; i<=10; i++ ))
do
  
  #Set a password for each user 
  passwrd="usr$i-1234"
  
  # Add user
  useradd "larryck$i"
  
  #Check if the user has been added
  if [ $? -eq 0 ]; then
    echo "larryck$i has been successfully added"
  else
    echo "Failed to add user$i"
  fi
  
  # Assign pasword to user
  echo "larryck$i:$(openssl passwd -1 "$passwd")" | chpasswd
  
  #Check if the password has been assigned
  if [ $? -eq 0 ]; then
    echo "larryck$i: Password successfully Assigned"
  else
    echo "Failed to add Password"
  fi

done
