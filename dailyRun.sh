#!/bin/bash

# Define log file path
LOG_FILE="$HOME/daily_tasks.log"

# Activate the virtual environment
echo "Activating virtual environment..." >> "$LOG_FILE"
source "$HOME/csvkit_env/bin/activate"

# Run pybaseballGatherer.py and append output to log file
echo "Running pybaseballGatherer.py..." >> "$LOG_FILE"
python "$HOME/mlb_pi/pybaseballGatherer.py" >> "$LOG_FILE" 2>&1

# Run newsFetch.py and append output to log file
echo "Running newsFetch.py..." >> "$LOG_FILE"
python "$HOME/mlb_pi/newsFetch.py" >> "$LOG_FILE" 2>&1

# Execute csvImport.sh and append output to log file
echo "Running csvImport.sh..." >> "$LOG_FILE"
"$HOME/mlb_pi/csvImport.sh" >> "$LOG_FILE" 2>&1

# Deactivate the virtual environment
echo "Deactivating virtual environment..." >> "$LOG_FILE"
deactivate

echo "Daily tasks completed on $(date)" >> "$LOG_FILE"
