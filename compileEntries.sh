export DEFAULT_TEMPLATES_PATH=/spin/templates
export OVERRIDE_TEMPLATES_PATH=/override/templates
export SOURCE_ROOT=/source
export TARGET_ROOT=/target

cd /source
for file in *.md
do
  /spin/compileEntry.sh $file
done
