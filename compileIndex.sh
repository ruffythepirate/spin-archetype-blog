
cd /source


ls *.md | extract-metadata.js | \
  map-inline.js -p title 'cat ${.filename} | extract-title.js' | \
  map-inline.js -p ingress 'cat ${.filename} | extract-ingress.js' 


