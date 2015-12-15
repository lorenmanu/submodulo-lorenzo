#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo docker pull lorenmanu/submodulo-lorenmanu
sudo docker run -i -t lorenmanu/submodulo-lorenmanu /bin/bash