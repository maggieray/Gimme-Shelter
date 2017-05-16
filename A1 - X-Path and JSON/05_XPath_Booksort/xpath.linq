<Query Kind="Program" />

void Main(){
    // XDocument vs XElement: different root position!
    
    var xdoc = XDocument.Load("booksort.xml").Dump("xdoc");	
    xdoc.XPathSelectElements("//book[author/last-name='Austen']/title").Dump("xdoc //...");
    xdoc.XPathSelectElements("bookstore/book[author/last-name='Austen']/title").Dump("xdoc bookstore/...");

    var xelem = XElement.Load("booksort.xml").Dump("xelem");	
    xelem.XPathSelectElements("//book[author/last-name='Austen']/title").Dump("xelem //...");
    xelem.XPathSelectElements("book[author/last-name='Austen']/title").Dump("xelem ...");
}