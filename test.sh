#!/bin/bash

docker build -t phpactor-move-class-use-classes-that-are-no-longer-in-scope .
docker run --rm -it phpactor-move-class-use-classes-that-are-no-longer-in-scope sh
