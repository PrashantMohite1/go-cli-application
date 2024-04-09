#!/bin/bash

echo "[  postgres backup script  ]"


DB_ENV=demo
DB_HOSTNAME='172.26.0.207'
DB_USERNAME='dfdbuseradmin'
DB_PASSWORD='&P>dF|dhH*:s8)*Hltp),|-hdm`:V[$t'


DB_BACKUP='dfmmdbdemo'


DB_BACKUP2='dfkeycloakdemo'

DB_BACKUP_DIR="/home/$USER/apps/database-backups"

DB_SCRIPT_DIRECTORY="/home/$USER/apps/git/scripts/common/postgres-backups-scripts/mmdb.sql"

# sourcing .env files 
echo "sourcing .env files "
# source $1

# below vars are used in docker container so dont change it
datetrimmed=$(date +%d-%m-%y-%H-%M)
DB_BACKUP_DIR_IN_CONT="/home/Prashant/db-backups/"
BACKUPFILENAME="$DB_ENV-$DB_BACKUP-$datetrimmed.sql"
BACKUPFILENAME2="$DB_ENV-$DB_BACKUP2-$datetrimmed.sql"


check_command() {
    if [ $? -eq 0 ]; then
        echo " [ Success: $1 !  ]"
    else
        echo " [ Error: happen in previouse command $1  ]"
        exit 1  # Exit the script if the command failed
    fi
}


CREATE_DIRS()
{
	if  [ ! -d $1 ]
		then
			echo " [Creating  $1  Directory ]"
			mkdir -p "$1"
			echo " [ Created the $1 directory successfully.. ]"
	else
			echo " [ Directory  $1 already present. ]"
	fi
}


echo "PGPASSWORD = ${DB_PASSWORD} "




#taking backup
# PGPASSWORD=${DB_PASSWORD} pg_dump -h "$DB_HOSTNAME" -U "$DB_USERNAME" -d "$DB_BACKUP" -Fc > "$DB_BACKUP_DIR_IN_CONT/$BACKUPFILENAME"


# check_command "Taking backup of $DB_BACKUP"

# PGPASSWORD=${DB_PASSWORD} pg_dump -h "$DB_HOSTNAME" -U "$DB_USERNAME" -d "$DB_BACKUP2" -Fc > "$DB_BACKUP_DIR_IN_CONT/$BACKUPFILENAME2"


# check_command "Taking backup of $DB_BACKUP2"


