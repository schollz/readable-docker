#!/bin/bash

rm -rf test-pages/aaa
mkdir test-pages/aaa
wget -q $1 -O test-pages/aaa/1.html
pandoc -f html -t html -o test-pages/aaa/2.html test-pages/aaa/1.html
tidy -q -utf8 -o test-pages/aaa/3.html test-pages/aaa/2.html  > /dev/null 2>&1
cat test-pages/aaa/3.html | html2xhtml > test-pages/aaa/source.html
node generate-testcase.js aaa
pandoc -f html -t plain test-pages/aaa/expected.html | grep -v "Continue reading"