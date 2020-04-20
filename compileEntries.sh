cd /source
export DEFAULT_TEMPLATES_PATH=/spin/templates
export OVERRIDE_TEMPLATES_PATH=/override/templates
export SOURCE_ROOT=/source
export TARGET_ROOT=/target

for file in *.md
do
  export FILE_PATH=$file
  echo Compiling $file
  CONTENT=$(cat $file | markdown.js | jqwrap.js content)
  META=$(echo $file | extract-metadata.js | jqwrap.js meta)
  echo -e "$CONTENT \n $META" | jqmerge.js | handlebars.js --inline true content | handlebars.js main \
    | write-to-target.js
done
