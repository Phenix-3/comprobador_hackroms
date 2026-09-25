#!/bin/bash

docker build -t bot-hackroms-go .                  
docker run --rm -v $(pwd):/data bot-hackroms-go
