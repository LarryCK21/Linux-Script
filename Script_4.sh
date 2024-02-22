/bin/bash

# Define the users whose home directories need to be backed up 
users="larryckl larryck2 larryck3 larryck4 larryck5"

# Set the directory where the backups will be temporarily stored 
backupdir="/tmp/backups-$(date + "%Y-%m-%d")"

#Set the directory where the Nas is mounted 
nasdir="/mnt/nas"

#Function to backup daily work files
backup daily_work(){
  # Create a temporary directory for backups 
  mkdir -p "$backupdir"
  
  #Zip the work files in each user's home directory
  for user in Susers do
    echo "Backing up daily work files for Suser"
    zip -r "$backupdir/$user-$(date +%Y-%m-%d ).zip /home/Suser"
  done 
}

#Function to send backups to Nas
send to nas() {
  echo "Sending backups to Nas......"
  # Mount Nas if not already mounted
  mount | grep "$nasdir" >/dev/null || mount "$nasdir"
  
  # Copy backup files to Nas
  cp -r "$backupdir" "$nasdir"
  #Delete the temporary backup directory
  rm -rf "$backupdir"
}

#Call the functions
backup daily_work
send to nas
