#!/bin/bash

rm -f feed.rss
awk -F '=' -f awk/rss-header.awk meta.txt > feed.rss
ls articles/*.md | sort -r | while read md_file; do
    fmt -s -w 80 $md_file | awk -f awk/rss-body.awk >> feed.rss
done
echo -e "</channel>\n</rss>" >> feed.rss
