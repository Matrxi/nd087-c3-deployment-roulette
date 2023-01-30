#!/bin/bash

while [ $(kubectl get pods -n udacity | grep -c blue) -gt 0 ]
do
  kubectl apply -f green.yml

  read -p "Continue with deployment? (y/n) " answer

  if [[ $answer =~ ^[Yy]$ ]] ;
  then
    echo "Finalizing deployment"
  else
    exit
  fi

  kubectl delete -f blue.yml
done
echo "Blue Green deployment successful :) "