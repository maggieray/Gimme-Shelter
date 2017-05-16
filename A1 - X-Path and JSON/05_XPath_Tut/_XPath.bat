.\XPath.exe authors.xml /authors/author[nationality]/name
.\XPath.exe authors.xml authors/author[nationality]/name
.\XPath.exe authors.xml authors/author[nationality='Canadian']/name
.\XPath.exe authors.xml authors/author[nationality!='Canadian']/name
.\XPath.exe authors.xml authors/author[not(nationality)]/name
.\XPath.exe authors.xml authors/author[not(nationality='Canadian')]/name
.\XPath.exe authors.xml authors/author[not(nationality!='Canadian')]/name
pause
