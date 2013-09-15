# web root  /var/www/
# backups folder /var/www/backups

alias webroot=/var/www/

function backupsite(){
        if [ -d ${webroot}$1 ]; then
                cd /var/www/vhosts/
                DATE=`date +%Y_%m_%d_%H%M%S`
                orig=$1
                FOLDER=${orig//\//.}
                FILENAME=${FOLDER}_${DATE}.tar.gz
                tar -zcvf ${webroot}backups/${FILENAME} $1
                printf "\e[1;34m\t .. ... .... .:::: :::::: ::::::: :|||||||||||||||: ::::::: :::::: ::::. .... ... ..\n"
                printf "\e[1;34m\t $1 Successfully backed up. \e[32m ${webroot}${FILENAME} \n"
                printf "\e[1;34m\t  \e[0m \n"
                sudo chmod 775 ${webroot}backups/${FILENAME}

        fi
}


## Examples and usage ###

## Full folder backup
##      backupsite examplesite 

## Sub Directory backup
##      examplesite/folder1/img
##
##		backupsite examplesite/folder1/img
##
##
