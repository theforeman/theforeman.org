#!/bin/bash
#
# Drop all the unused i18n from all generated API docs
#

# Remove the i18n files
for L in ca cs_CZ de en en_GB es fr gl it ja ko nl_NL pl pt_BR ru sv_SE zh_CN zh_TW
do
  find . -name "*.$L.html" -exec rm -f {} +
done

# Remove the links at the top of each file to i18n files
find . -name "*.html" -exec sed -i 's/&nbsp;\[.*\]//' {} \;
