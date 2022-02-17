#!/bin/bash
#  This script converts .html to pdf then merges them

URL=$1
VERSION=$(basename $URL)

pages=""

html_pages=$(wget -np --spider -r $URL 2>&1 | grep '^--' | awk '{ print $3 }' | grep -v '\.\(css\|js\|png\|gif\|jpg\|JPG\)$' | grep -v 'apidoc' | grep html | awk '!x[$0]++' | tr "\n" " ")

pdf_list=""

echo "Converting html files to pdf..."
for FIL in $html_pages; do
   html_output_name=`echo $FIL | cut -d@ -f2 | cut -d/ -f7- | sed 's/\//_/g'`
   wget $FIL --convert-links -A jpg,jpeg,gif,png -O $html_output_name || rm -f $html_output_name
   if [ -s $html_output_name ]
   then
   	pdf_output_name=`echo ${html_output_name/.html/.pdf}`
   	wkhtmltopdf --disable-internal-links --disable-external-links $html_output_name $pdf_output_name
   	pdf_list="${pdf_list} ${pdf_output_name}"
   fi
done

echo "Combining pdf files..."
pdfunite ${pdf_list} katello_${VERSION}_manual.pdf

