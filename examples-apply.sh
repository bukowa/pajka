#!/bin/bash
for dir in examples/*; do echo $(cd $dir && ../../pajka.sh | kubectl apply -f -); done