<Query Kind="Program" />

// Notes:
// - a slighlty longer body avoids the dynamic type
// - a crisper body is possible using the XPATH string() function
// Your choice...
string selector(XElement x, string path) {
    var y = x.XPathEvaluate(path) as IEnumerable<object>;
    if (y == null) return null;
    dynamic z = y.FirstOrDefault();
    if (z == null) return null;
    return z.Value; // expected y : XElement or XAttribute
}

void Main2(string fname, string xpath, string spath, string fname2) {
    var xdoc = XDocument.Load(fname).Dump(fname);
    var xseq = xdoc.XPathSelectElements(xpath); //.Dump("xseq");
    var xseq2 = xseq.OrderBy(x => selector(x, spath), StringComparer.Ordinal); //.Dump("xseq2");
    var xelem2 = new XElement("root", xseq2).Dump(fname2);
    xelem2.Save(fname2);
}

void Main() {
    try {
        Main2("PurchaseReportSample.xml", "PurchaseReport/orders/partref", "zipcode", "_output1.xml");
        Main2("PurchaseReportSample.xml", "PurchaseReport/orders/partref", "@quantity", "_output2.xml");
        
    } catch (Exception ex) {
        Console.Error.WriteLine("*** Exception: {0}", ex.Message);
    }
}