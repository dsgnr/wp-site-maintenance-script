#!/usr/bin/env bash
# Author: Daniel Hand // www.danielhand.io

DATE=`date +%d-%m-%Y`
SITESTORE=/home
SITELIST=($(ls -lh $SITESTORE | awk '{print $9}'))
BACKUPPATH=/backups

for SITE in ${SITELIST[@]};
do
mkdir -p $BACKUPPATH/$SITE/$DATE
cd /home/$SITE/public_html
sudo wp db export $BACKUPPATH/$SITE/$DATE/$SITE-$DATE.sql --allow-root
tar -czf $BACKUPPATH/$SITE/$DATE/$SITE-$DATE.tar.gz $SITESTORE/$SITE
sudo wp core update --allow-root
sudo wp core update-db --allow-root
sudo wp plugin update --all --allow-root
sudo wp core update-db --allow-root
sudo wp db optimize --allow-root
find $BACKUPPATH/$SITE -mindepth 1 -maxdepth 1 -type d -cmin +120 | xargs rm -rf
echo "find $BACKUPPATH/$SITE -mindepth 1 -maxdepth 1 -type d -cmin +120 | xargs rm -rf"
done
