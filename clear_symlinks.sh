#!/bin/bash
find autoload colors doc ftdetect ftplugin plugin syntax spell -type l | xargs ls -l | grep src | awk '{print $9}' | xargs rm
