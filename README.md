# Bash To-Do List Script

This Bash script provides a simple command-line interface for managing a to-do list. It allows users to add tasks with priorities, due dates, and categories, remove tasks by their numbers, and list all tasks with their details.

## Features

- Add tasks with priorities, due dates, and categories.
- Remove tasks by their numbers.
- List all tasks with their details.

## Prerequisites

- Bash shell (compatible with most Unix-like operating systems)

## Usage

1. Clone or download the repository to your local machine.

2. Make the script executable:
   ```bash
   chmod 777 todo.sh

After that

1. Run the script with appropriate commands:

    * To add a task:
    ```bash
    ./todo.sh add [priority] [due_date] [category] [task_description]
    ```
    * To remove a task:
    ```bash
    ./todo.sh remove <task_number>
    ```
    * To list all the tasks
    ```bash
    ./todo.sh list
    ```
2. Follow the on-screen prompts and instructions to interact with the to-do list.

## Examples

* Adding a task:
  ```bash
  ./todo.sh add high "2024-04-05" work "Complete project"

* Listing task:
  ```bash
  ./todo.sh list

* Removing a task (assuming task number 1 needs to be removed):
  ```bash
  ./todo.sh remove 1

## Notes

- Tasks are stored in a file named `todo.txt` in the same directory as the script.
* Tasks are stored in a file named todo.txt in the same directory as the script. Ensure proper file permissions for read and write access.
* Task priorities can be set as high, mid, or low.
