#!/bin/bash
konsole -e bash -c "
for file in documents/*/*; do mv -v "$file" "$(sed 's/é/e/g; s/è/e/g' <<< $file)" 2> /dev/null; done
git pull
git add -A
git commit -m \"upload.sh $(date)\"
git push origin main
echo -e \"\nappuie sur une touche pour quitter\"
read
"
