#!/bin/bash
konsole -e bash -c '
while read file; do
  mv -v "${file}" "$(sed "s/é/e/g; s/è/e/g; s/ \?Microsoft Word//g" <<< ${file})"
done <<< $(fd -d t "é|è|Microsoft Word")
git pull --no-edit origin main
git add -A
git commit -m "upload.sh $(date)"
git push origin main
echo -e "\nappuie sur une touche pour quitter"
read
'
