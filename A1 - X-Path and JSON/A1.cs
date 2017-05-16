using Newtonsoft.Json;
using System.Xml;

void Main(string[] args)
{
	try{
		string seq1 = args[0];
		string seq2 = args[1];
		string seq3 = args[2];
		string seq4 = args[3];
		string seq5 = args[4];
		string seq6 = args[5];
		string seq7 = args[6];
		string seq8 = args[7];
		string seq9 = args[8];
		string seq10 = args[9];
		
		string[] loc = seq1.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq2.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq3.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq4.Split(new char[] {' '});
		string[] loc1 = {loc[0], loc[1], loc[2], loc[3], loc[4]};
		string[] loc2 = {loc[5], loc[6], loc[7], loc[8], loc[9]};
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq5.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq6.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq7.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq8.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq9.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
		
		loc = seq10.Split(new char[] {' '});
		process(new string[] {loc[0], loc[1], loc[2], loc[3], loc[4]}, "left");
		process(new string[] {loc[5], loc[6], loc[7], loc[8], loc[9]}, "right");
	} catch(IndexOutOfRangeException e) {
		Console.Error.WriteLine("Exeption: Too few arguments (10 needed)");
	} catch (Exception e) {
        Console.Error.WriteLine("Exception: {0}", e.Message);
    }
}

void json(string[] loc, string direction) {
	var jo = JObject.Parse(File.ReadAllText(@"" + loc[0]));
	var doc = (XDocument)JsonConvert.DeserializeXmlNode(jo.toString());
	//sort here
	var ord = StringComparer.Ordinal;
	var xseq = doc.XPathSelectElements(loc[1]);
	var xseq2 = xseq.OrderBy(x => selector(x, loc[3]), ord);
	doc.Root.AddBeforeSelf(new XElement("LeftSeq"));
	if(direction == "left") {
		doc.Save("_LeftSeq.xml");
	} else {
		doc.Save("_RightSeq.xml");
	}
}

void xml(string[] loc, string direction) {
	var doc = XDocument.Parse(File.ReadAllText(loc[0]));
	var ord = StringComparer.Ordinal;
	var xseq = doc.XPathSelectElements(loc[1]);
	var xseq2 = xseq.OrderBy(x => selector(x, loc[3]), ord);
	doc.Root.AddBeforeSelf(new XElement("LeftSeq"));
	if(direction == "left") {
		doc.Save("_LeftSeq.xml");
	} else {
		doc.Save("_RightSeq.xml");
	}
}

void odata(string[] loc, string direction) {
	
}

void process(string[] loc, string direction) {
	string[] extention = loc[0].Split(new char[] {' '});
	if(extention[1] == "xml" || extention[1] == "Xml") {
		xml(loc, direction);
	} else if(extention[1] == "json" || extention[1] == "Json") {
		json(loc, direction);
	} else {
		odata(loc, direction);
	}
}

string selector(XElement x, string path) {
    var y = x.XPathEvaluate(path) as IEnumerable<object>;
    if (y == null) return null;
    dynamic z = y.FirstOrDefault();
    if (z == null) return null;
    return z.Value; // expected y : XElement or XAttribute
}