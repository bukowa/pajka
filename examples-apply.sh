#!/bin/bash
for dir in examples/*; do echo $(cd $dir && ../../generate.sh | kubectl apply -f -); done