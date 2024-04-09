#!/bin/bash


PRESENT_DIRECTORY=$(pwd)
USER=$(whoami)



check_command() {
    if [ $? -eq 0 ]; then
        echo " [  Success: $1 !  ]"
    else
        echo " [  Error: Occured in previous command $1  ]"
        exit 1  # Exit the script if the command failed
    fi
}

CREATE_DIRS()
{
	if  [ ! -d $1 ]
		then
			echo "[Creating  $1  Directory ]"
			mkdir -p "$1"
			echo "[ Created the $1 directory successfully.. ]"
	else
			echo "[ Directory  $1 already present. ]"
	fi
}


# sourcing .env files 
source $1 && echo "sourcing $1 "

check_command "source sending df-agent .env"


CREATE_DIRS $DB_BACKUP_DIR

CREATE_DIRS $DUMPS_PENDING_TO_SEND_DF


echo "running docker command for taking backup "
docker run --rm -i -v $DB_SCRIPT_DIRECTORY:/home/temp/scripts/ -v $DUMPS_PENDING_TO_SEND_DF:/home/temp/db-backups/ $DOCKER_IMAGE_NAME /bin/bash -c " /home/temp/scripts/postgres-backup.sh"


check_command "database backup "

cd $DUMPS_PENDING_TO_SEND_DF

# copy file to which are sending to df 
for i in $(ls $DUMPS_PENDING_TO_SEND_DF);
do 
    cp $DUMPS_PENDING_TO_SEND_DF/$i $DB_BACKUP_DIR
    check_command $i;
done

check_command "storing dumps to $DB_BACKUP_DIR"



cd $DF_AGENT_DIR


echo "[ running for loop for sending backup to df]"
for i in $(ls $DUMPS_PENDING_TO_SEND_DF);
do 
    ./df-agent -u $USERNAME -p $PASSWORD -up -f $DUMPS_PENDING_TO_SEND_DF/$i -l $LOCATION_ID
    check_command "$i upload";
    rm -f $DUMPS_PENDING_TO_SEND_DF/$i
done

check_command "for-look for uploading file to df"


cd $DB_BACKUP_DIR


# code to keep only latest specified no of files in directory  

# # Change to the specified directory , 
cd "$DB_BACKUP_DIR" || exit                     #here || used to exit if we are not able to cd into directory


# # Get the list of files sorted by modification time in reverse order
files=($(ls -t | grep -v '^$' | head -n $NO_OF_FILES_TO_KEEP))

# Loop through the files and delete the older ones
for file in *; do
  if [[ ! " ${files[@]} " =~ " ${file} " ]]; then                #here ~ tilda is very important this is responsible for correct match  # it find exact pattern of file without worrying about spaces                                                  
    rm -f "$file"
    echo "deleted file: $file"
  fi
done

check_command "you have kept only $NO_OF_FILES_TO_KEEP files in $DB_BACKUP_DIR and removed other files"

# specifiy below remove-file-older than

# if you given REMOVE_FILE_OLDER_THAN=30 then files which are before 30 days will have removed
find $DB_BACKUP_DIR -type f -mtime +$REMOVE_FILE_OLDER_THAN -delete      #to test this command you can use -print insteand of remove

check_command "the files older than $REMOVE_FILE_OLDER_THAN days are removed from $DB_BACKUP_DIR. "

cd $PRESENT_DIRECTORY



