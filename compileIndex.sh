#!/usr/bin/env sh
set -e

spin_path=/spin
current_path=$spin_path

if [ -z "$RELATIVE_PATH" ]; then echo 'The environment variable $RELATIVE_PATH must be set!'; exit 1; fi

source_path=/source
cd $source_path

export DEFAULT_TEMPLATES_PATH=$spin_path/templates
export OVERRIDE_TEMPLATES_PATH=/override/templates
export SOURCE_ROOT=$source_path
export TARGET_ROOT=/target

output_path=$(realpath $TARGET_ROOT/$RELATIVE_PATH)

echo Creating index file...

ls *.md | extract-metadata.js | \
  map-inline.js -p title 'cat ${.filename} | extract-title.js' | \
  map-inline.js -p ingress 'cat ${.filename} | extract-ingress.js' | \
  jqwrap.js blogTeasers | \
  jqassign.js -p imports "basename -a $current_path/css/*.css | sed 's/^/\/css\//' | create-link-tag.js | wrap-array.js" | \
  handlebars.js --inline true index  | \
  handlebars.js main > $output_path/index.html

echo Index file created

