#!/bin/bash

#Function to display the top processes consuming re

display top_processes() {
  echo "Top processes consuming resources:"
  
  # Display the list of Processes consuming ressources ordered by the amount of resources they consumed (in %)
  echo ""
  echo "PID PPID %MEM %CPU"
  ps -eo pid,ppid,%mem,%cpu | sort -k3nr | head
}

display_top_processes
