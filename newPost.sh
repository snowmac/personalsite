#!/usr/bin/env bash
timestamp=$(date +'%Y-%m-%d')
argumentsAsString="$*"
hypened="${argumentsAsString// /-}"
filename="_posts/$timestamp-$hypened.md"

touch $filename

echo "---" >> $filename
echo "layout: post" >> $filename
echo "title: $*" >> $filename
echo "permalink: /$(date +'%Y/%m/%d')/$hypened" >> $filename
echo "published: false" >> $filename
echo "---" >> $filename

