<Query Kind="Program" />

void Main(){
    // XDocument vs XElement: different root position!
    
    var xdoc = XDocument.Load("authors.xml"); //.Dump("xdoc");	
    xdoc.XPathSelectElements("/authors/author[1]").FirstOrDefault().Dump("xdoc /authors/author[1]");
    xdoc.XPathSelectElements("authors/author[1]").FirstOrDefault().Dump("xdoc authors/author[1]");
    xdoc.XPathSelectElements("//author[1]").FirstOrDefault().Dump("xdoc //author[1]");
    xdoc.XPathSelectElements("author[1]").FirstOrDefault().Dump("xdoc author[1]");

    var xelem = XElement.Load("authors.xml"); //.Dump("xelem");	
    xelem.XPathSelectElements("/authors/author[1]").FirstOrDefault().Dump("xelem authors/author[1]");
    xelem.XPathSelectElements("authors/author[1]").FirstOrDefault().Dump("xelem authors/author[1]");
    xelem.XPathSelectElements("//author[1]").FirstOrDefault().Dump("xelem //author[1]");
    xelem.XPathSelectElements("author[1]").FirstOrDefault().Dump("xelem author[1]");
}