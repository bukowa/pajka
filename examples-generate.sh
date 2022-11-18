#!/bin/bash
for dir in examples/*; do echo $(cd $dir && ../../generate.sh > ../../${dir##*/}.yaml); done
