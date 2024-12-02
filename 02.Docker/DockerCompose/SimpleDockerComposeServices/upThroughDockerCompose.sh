#!/bin/bash

echo
echo "-----------------------------------------------------------------------------------------------------"
echo
echo "First attampt to run multipe Service as a simple Microservices :)"
echo "Let bring up our service through  docker compose"
echo
echo "-----------------------------------------------------------------------------------------------------"
echo 
echo "Note: When you running this script, docker compose will run your containers in background"
echo "      To checking your cointiners work properly you can use 'docker ps' command."
echo 
echo "To bring down all cointiners that runned by docker compose you can use 'docker compose down' command "
echo
echo "-----------------------------------------------------------------------------------------------------"


docker compose up -d
