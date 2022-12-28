#!/bin/bash

gcc -c miniserver.c
gcc -o miniserver miniserver.o -lfcgi
spawn-fcgi -p 8080 ./miniserver
nginx -g "daemon off;"