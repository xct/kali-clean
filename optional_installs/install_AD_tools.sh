#!/usr/bin/env bash
sudo wget https://raw.githubusercontent.com/Kevin-Robertson/Powermad/master/Powermad.ps1 -P /opt/win
sudo wget https://raw.githubusercontent.com/leoloobeek/LAPSToolkit/master/LAPSToolkit.ps1 -P /opt/win
sudo wget https://raw.githubusercontent.com/BC-SECURITY/Empire/main/empire/server/data/module_source/credentials/Invoke-Kerberoast.ps1 -P /opt/win
sudo wget https://raw.githubusercontent.com/BC-SECURITY/Empire/main/empire/server/data/module_source/exploitation/Invoke-SpoolSample.ps1 -P /opt/win
# kerbrelayx
git clone https://github.com/dirkjanm/krbrelayx.git /tmp/krbrelayx
mkdir -p $HOME/.local/bin
mv /tmp/krbrelayx/addspn.py $HOME/.local/bin && chmod +x $HOME/.local/bin/addspn.py
mv /tmp/krbrelayx/dnstool.py $HOME/.local/bin && chmod +x $HOME/.local/bin/dnstool.py
mv /tmp/krbrelayx/krbrelayx.py $HOME/.local/bin && chmod +x $HOME/.local/bin/krbrelayx.py
mv /tmp/krbrelayx/printerbug.py $HOME/.local/bin && chmod +x $HOME/.local/bin/printerbug.py
mv /tmp/krbrelayx/lib $HOME/.local/bin
