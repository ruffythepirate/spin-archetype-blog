#!/usr/bin/env sh
set -e

spin_path=/spin
current_path=$spin_path

source_path=/source
cd $source_path

export DEFAULT_TEMPLATES_PATH=$spin_path/templates
export OVERRIDE_TEMPLATES_PATH=/override/templates
export SOURCE_ROOT=$source_path
export TARGET_ROOT=/target

if [ -z "$RELATIVE_PATH" ]; then echo 'The environment variable $RELATIVE_PATH must be set!'; exit 1; fi
output_path=$(realpath $TARGET_ROOT/$RELATIVE_PATH)

echo Creating RSS...

ls *.md | extract-metadata.js \
  | jqsort.js filename \
  | jqtake.js 10 \
  | map-inline.js -p title 'cat ${.filename} | extract-title.js' \
  | map-inline.js -p ingress 'cat ${.filename} | extract-ingress.js' \
  | jqrss.js -t "Developer Blog" -d "Small thoughts in the world of my coding" -l "http://dev-blog.com" > $output_path/rss.xml

echo RSS File created


