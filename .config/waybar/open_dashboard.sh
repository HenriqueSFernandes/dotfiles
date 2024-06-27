# Function to execute a command and capture its output
exec_cmd() {
  local cmd="$1"
  local result
  result=$(eval "$cmd")
  echo "$result"
}

# Function to split a string into an array based on a delimiter
split() {
  local str="$1"
  local delimiter="$2"
  local tokens=()
  IFS="$delimiter" read -r -a tokens <<<"$str"
  echo "${tokens[@]}"
}

# Main logic starts here

if /home/ricky/Applications/eww active-windows | grep "controlcenter"; then
  $(/home/ricky/Applications/eww close-all)
  exit 0
else

  # Command to execute
  command="hyprctl monitors"

  # Execute the command and capture output
  output=$(exec_cmd "$command")

  # Split the output by new lines
  IFS=$'\n' read -r -d '' -a lines <<<"$output"

  # Regex pattern to match lines containing "ID <id here>:" and extract the ID
  id_regex="ID\s+(\S+):"

  inBlock=false
  id=-1

  # Loop through each line
  for line in "${lines[@]}"; do
    if [[ $line =~ $id_regex ]]; then
      monitorID="${BASH_REMATCH[1]}"
      monitorID="${monitorID%?}" # Remove the last character (colon)
      id="$monitorID"
      inBlock=true
    fi

    # Check if currently in a block and line contains "focused: yes"
    if $inBlock && [[ $line =~ focused:\ yes ]]; then
      break
    fi
  done

  # If id is still -1, exit with error status
  if [ "$id" == -1 ]; then
    exit 1
  fi

  # Construct the eww command
  eww_command="/home/ricky/Applications/eww open controlcenter --screen $id"

  # Execute the eww command and capture output
  $eww_command

fi
exit 0
