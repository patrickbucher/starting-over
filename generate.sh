#!/bin/bash

# generate html page
PAGE=index.html
cat html/header.html > $PAGE
ls articles/*.md | sort -r | while read md_file; do
    echo '<article>' >> $PAGE
    awk -f 'awk/typography.awk' $md_file | markdown \
        | sed '/^\s*$/d' | sed -r -f 'sed/add_link.sed' >> $PAGE
    echo '</article>' >> $PAGE
done
cat html/footer.html | sed "s/\$DATE/`date`/" >> $PAGE

# generate RSS feed
./rss.sh
