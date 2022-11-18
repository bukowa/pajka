#!/bin/bash
for dir in examples/*; do echo $(cd $dir && ../../pajka.sh > ../../${dir##*/}.yaml); done
