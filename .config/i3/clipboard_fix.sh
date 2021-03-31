#!/bin/bash

pkill vmtoolsd 2> /dev/null
vmtoolsd -n vmusr
