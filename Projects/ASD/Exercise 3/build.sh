#!/bin/sh
rm -rf ./out/*;
mkdir ./out/;
cd src;
javac -d ../out/ ./unionfindset/*.java || exit;
javac -d ../out/ -cp ".:/unionfindset/.*:/usr/share/java/junit4.jar:/usr/share/java/hamcrest-core-1.3.jar:" ./test/*.java || exit;
