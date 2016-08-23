A small bash script to make maintenance on multiple WordPress websites based on the same server easier.

The bash script cycles through each site based in the $SITESTORE location and completes the following:
* Create a filesystem backup of the website and save a tar.gz in the /backup location
* Create a database backup of the website and save the .sql file in the /backup location
* Update the WP core
* Update all plugins
* Update the database
* Optimise the database
* Clear old backups more than 2 hours old

Uses WP-CLI to perform WordPress related tasks.
