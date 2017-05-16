.\XPath.exe booksort.xml //book/title
.\XPath.exe booksort.xml //book/author
.\XPath.exe booksort.xml //book/author/last-name
.\XPath.exe booksort.xml //book/author[last-name='Austen']
.\XPath.exe booksort.xml //book[author/last-name='Austen']
.\XPath.exe booksort.xml //book[author/last-name='Austen']/title
pause
