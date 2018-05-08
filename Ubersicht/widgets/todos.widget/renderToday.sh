#!/usr/bin/env bash
python ~/t/t.py --task-dir ~/mytasks --list tasks.txt -g @today | perl -pe "s/^(([A-z]|[0-9])*?\\s*?)-\\s(.+)/\<div\>\<div class='prefix'\>\$1\<\/div\>\<div class='task'\>\$3\<\/div\>\<\/div\>/g"
