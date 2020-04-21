source_path=~/ProgrammingDiary

current_path=$PWD
cd $source_path

source ~/code/spin/archetype-base/import.sh

export DEFAULT_TEMPLATES_PATH=$current_path/templates
export OVERRIDE_TEMPLATES_PATH=/override/templates
export SOURCE_ROOT=$source_path
export TARGET_ROOT=./target

ls *.md | extract-metadata.js | \
  map-inline.js -p title 'cat ${.filename} | extract-title.js' | \
  map-inline.js -p ingress 'cat ${.filename} | extract-ingress.js' | \
  jqwrap.js blogTeasers | \
  jqassign.js -p imports 'basename -a $current_path/css/*.css | sed "s/^/\/css\//" | create-link-tag.js | wrap-array.js' #| \ 
  #handlebars.js --inline true index  | \
  #handlebars.js main




