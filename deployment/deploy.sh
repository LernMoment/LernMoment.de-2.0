#!/bin/bash
# Skript zum Deployment von LernMoment.de
# Hier wird vorrausgesetzt, dass ich Zugriff auf alle SSH Keys usw. habe!

# Abbrechen, wenn es zu einem Fehler kommt
set -e

# Eingabe in Variable sichern
ENV="$1"
if [ -z "$2" ]
then
  # Standardmäßig soll die Site vom Branch master erzeugt werden
  SELECTED_BRANCH=master
else
  # Wenn ein Branch angegeben wurde, verwenden wir den!
  SELECTED_BRANCH="$2"
fi

# Verzeichnis in das jekyll die Seite erzeugt
SITE_SOURCE=_site

# Momentan läuft alles lokal. Da teste ich nur, ob ich auch im richtigen Branch bin.
# Später sollte ich für jeden build den passenden branch aus github holen!
if [ "$SELECTED_BRANCH" != "$(git symbolic-ref --short -q HEAD)" ]
then
  echo "ABBRUCH: Du bist nicht im $SELECTED_BRANCH branch!"
  exit 1
fi

# Informationen für Staging
STAGING_SITE_CONFIG=_config.yml,_config-staging.yml
STAGING_ZIPPED_SITE=deployment/lm-site-staging.tgz
STAGING_SERVER_AREA=1und1:staging

#Informationen für Production
PRODUCTION_SITE_CONFIG=_config.yml
PRODUCTION_ZIPPED_SITE=deployment/lm-site-production.tgz
PRODUCTION_SERVER_AREA=1und1:production
PRODUCTION_BRANCH=master

if [ "$ENV" == "production" ]
then
  SITE_CONFIG=$PRODUCTION_SITE_CONFIG
  ZIPPED_SITE=$PRODUCTION_ZIPPED_SITE
  SERVER_AREA=$PRODUCTION_SERVER_AREA

  # Sicherheitsüberprüfung für Production. Ich will nur vom zulässigen PRODUCTION_BRANCH
  # deployen!
  if [ "$SELECTED_BRANCH" != "$PRODUCTION_BRANCH" ]; then
    echo "ABBRUCH: Du kannst nur aus dem $PRODUCTION_BRANCH branch ein Deployment für $ENV machen!"
  fi

elif [ "$ENV" == "staging" ]
then
  SITE_CONFIG=$STAGING_SITE_CONFIG
  ZIPPED_SITE=$STAGING_ZIPPED_SITE
  SERVER_AREA=$STAGING_SERVER_AREA
else
  echo "So werde ich benutzt: $0 [environment name] (entweder production oder staging)"
  exit 1
fi

echo "Local #1 -> Lösche die bisherige Version"
rm -rf $SITE_SOURCE
rm -f $ZIPPED_SITE

echo "Local #2 -> Erstelle Seite neu für $ENV"
docker build . -t lernmoment:latest
docker run --rm -v $(pwd):/src -v /src/node_modules -v /src/.sass-cache -e "TZ=Europe/Berlin" -e "LANG=C.UTF-8" --entrypoint="/bin/bash" -p 4000:4000 lernmoment:latest -c "jekyll build --config $SITE_CONFIG --no-watch"
tar cvzf $ZIPPED_SITE $SITE_SOURCE

echo "Local #3 -> Kopiere neue Version auf Server nach: $ENV"
scp $ZIPPED_SITE $SERVER_AREA

echo "Local #4 -> Starte deploy-on-server script auf Server"
ssh 1und1 'bash -s' < deployment/deploy-on-server.sh $ENV

echo "Neue Seite ist aktiv auf: $ENV ! Ist MailChimp vorbereitet????"
