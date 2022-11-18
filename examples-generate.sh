#!/bin/bash
for dir in examples/*; do echo $(cd $dir && ../../pajka.sh > ./generated/generated.yaml); done
