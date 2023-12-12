#!/usr/bin/env bash

sudo DEBIAN_FRONTEND=noninteractive apt -yq install texlive-latex-recommended texlive-fonts-extra texlive-latex-extra pandoc
mkdir -p $HOME/.local/share/pandoc/templates
wget $(curl -sL https://api.github.com/repos/Wandmalfarbe/pandoc-latex-template/releases/latest | jq -r ".assets[].browser_download_url" | grep Eisvogel.zip) -P /tmp
7z x /tmp/Eisvogel.zip -o$HOME/.local/share/pandoc/templates/ eisvogel.latex

git clone https://github.com/noraj/OSCP-Exam-Report-Template-Markdown.git $HOME/OSCP-Exam-Report-Template-Markdown

