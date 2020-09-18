export DEFAULT_TEMPLATES_PATH=/spin/templates
export OVERRIDE_TEMPLATES_PATH=/override/templates
export SOURCE_ROOT=/source
export TARGET_ROOT=/target

cd /source
file=$1
export FILE_PATH=$file
echo Compiling $file
echo "{}" | \
    jqassign.js -p content "cat $file | markdown.js" \
    | jqassign.js -p meta "echo $file | extract-metadata.js" \
    | jqassign.js -p title "echo $file | extract-title.js" \
    | jqassign.js -p imports "basename -a /spin/css/*.css | sed 's/^/\/css\//' | create-link-tag.js | wrap-array.js" \
    | handlebars.js --inline true content | handlebars.js main \
    | write-entry-html.js
