#!/bin/bash

# Configuration
LOG_FILE="/var/log/maintenance.log"
# Ensure your scripts are in your PATH or use absolute paths
LOG_ROTATE_SCRIPT="/home/sachin/scripts/log_rotate.sh"
BACKUP_SCRIPT="/home/sachin/scripts/backup.sh"

# Function to log messages with timestamps
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

log_message "Starting scheduled maintenance."

# Call Log Rotation
log_message "Running log rotation..."
bash "$LOG_ROTATE_SCRIPT" /var/log/myapp >> "$LOG_FILE" 2>&1

# Call Backup
log_message "Running backup..."
bash "$BACKUP_SCRIPT" /home/user/data /backups >> "$LOG_FILE" 2>&1

log_message "Maintenance completed successfully."
