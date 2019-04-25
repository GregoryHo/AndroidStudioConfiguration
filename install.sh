#!/bin/bash
# Installs Greg's AndroidStudio configs into your user configs.
#
# Reference from https://github.com/square/java-code-styles

echo "Installing Greg AndroidStudio configs..."

CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/configs"

for i in $HOME/Library/Preferences/AndroidStudio* \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    # Install codestyles
    mkdir -p $i/codestyles
    cp -frv "$CONFIGS/codestyles"/* $i/codestyles

    # Install colors
    mkdir -p $i/colors
    cp -frv "$CONFIGS/colors"/* $i/colors

    # Install fileTemplates
    mkdir -p $i/fileTemplates
    cp -frv "$CONFIGS/fileTemplates"/* $i/fileTemplates

    # Install inspections
    mkdir -p $i/inspection
    cp -frv "$CONFIGS/inspection"/* $i/inspection

    # Install options ("Exclude from Import and Completion")
    mkdir -p $i/options
    cp -frv "$CONFIGS/options"/* $i/options

    # Install templates
    mkdir -p $i/templates
    cp -frv "$CONFIGS/templates"/* $i/templates

    # Install tools
    mkdir -p $i/tools
    cp -frv "$CONFIGS/tools"/* $i/tools
  fi
done

echo "Done."
echo ""
echo "Restart IntelliJ and/or AndroidStudio, go to preferences, and apply 'SquareAndroid'."
