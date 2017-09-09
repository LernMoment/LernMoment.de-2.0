#!/bin/bash
# Skript zum Deployment von LernMoment.de - wird auf dem Server ausgeführt!

# Abbrechen, wenn es zu einem Fehler kommt
set -e

# Eingabe in Variable sichern
ENV="$1"

# Allgemeine Informationen
SITE=lernmoment
SITE_NEW=_site
SITE_PREVIOUS=lernmoment-old

# Informationen für Staging
STAGING_ZIPPED_SITE=lm-site-staging.tgz
STAGING_SERVER_AREA=~/staging

# Informationen für Production
PRODUCTION_ZIPPED_SITE=lm-site-production.tgz
PRODUCTION_SERVER_AREA=~/production

if [ "$ENV" == "production" ]
then
  ZIPPED_SITE=$PRODUCTION_ZIPPED_SITE
  SERVER_AREA=$PRODUCTION_SERVER_AREA
elif [ "$ENV" == "staging" ]
then
  ZIPPED_SITE=$STAGING_ZIPPED_SITE
  SERVER_AREA=$STAGING_SERVER_AREA
else
  echo "So werde ich benutzt: $0 [environment name] (entweder production oder staging)"
  exit 1
fi

echo 'Remote #1 -> In den passenden Bereich wechseln'
cd $SERVER_AREA

echo 'Remote #2 -> Vorherige Version löschen'
rm -rf $SITE_PREVIOUS

echo 'Remote #3 -> Neue Version extrahieren und Archive löschen'
tar xvzf $ZIPPED_SITE
rm $ZIPPED_SITE

echo 'Remote #4 -> Aktuelle Version sichern und neue veröffentlichen'
mv $SITE $SITE_PREVIOUS
mv $SITE_NEW $SITE
