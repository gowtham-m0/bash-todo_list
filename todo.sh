#!/bin/bash


# File to store the to-do list
todo_file="todo.txt"

# Color codes definition for formatting output
color_off='\033[0m'
red='\033[0;31m'
yellow='\033[0;33m'
green='\033[0;32m'

# Function to add tasks
add(){
	timestamp=$(date "+%Y-%m-%d %H:%M:%S")
	task="$timestamp $@"
	echo "$task" >> "$todo_file"
	echo -e "${green}Task added: $task ${color_off}"
}

# Function to remove a task from the to-do list file
remove(){
	task_number="$1"
	if [ -f "$todo_file" ]; 
	then
		total_task=$(wc -l < $todo_file)
		if [ $task_number -gt 0 ] && [ $task_number -le $total_task ];
		then
			sed -i "${task_number}d" "$todo_file"
			echo -e "${green}Task $task_number removed. ${color_off}"
		else
			echo -e "${red}Task number not found. ${color_off}"
		fi	
			
	else 
		echo -e "${red}To-do list file not found ${color_off}"
	fi
}

# Function to display all the tasks in the to-do list file
list(){
	if [ -f "$todo_file" ];
	then
		if [ -s "$todo_file" ];
		then
			echo -e " ${yellow}To-Do list ${color_off}"
			awk '{ printf "%d. Priority: %s	Created: %s	Due: %s		Category: %s	 - " ,NR,$5,$1,$3,$7; for (i=8; i<=NF; i++) printf "%s ",$i; print "" }' < $todo_file
		else
			echo -e "${yellow}No tasks found ${color_off}"
		fi
	else
		echo -e "${red}To-do list file not found. ${color_off}"
	fi
}


# Main function to handle command line arguments
main(){
	# Check if atleast one argument is provided if not then print the instructions
	if [ $# -lt 1 ] ;
	then
		echo "Usage: $0 [command] [arguments]";
		echo "Commands: "
		echo "add [priority] [due_date] [category] [tasks]: Add a new task"
		echo "remove [task_number] : Remove a task"
		echo "list: List all the taks" 
		exit 1
	fi
	command="$1"
	case $command in 
		add)
			if [ $# -lt 5 ] ;
			then 
				echo "Usage: $0 add [priority] [due_date] [category] [task]"
				exit 1
			fi
			shift
			add $(date "+%Y-%m-%d %H:%M:%S") $@
			;;

		remove)
			if [ $# -ne 2 ];
			then
				echo "Usage $0 remove [task_number]"
				exit 1
			fi
			remove $2
			;;
		list)
			list
			;;
		*)
			echo "Invalid command: $command"
			exit 1
			;;
	esac
}

# Calling the main function with command-line arguments
main $@
