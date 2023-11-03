// See https://aka.ms/new-console-template for more information
using System.Text;
using System.Xml;

Console.WriteLine("Hello, World!");


var messages = new StringBuilder();
var settings = new XmlReaderSettings { ValidationType = ValidationType.DTD };
settings.ValidationEventHandler += (sender, args) => messages.AppendLine(args.Message);
var reader = XmlReader.Create("http://localhost:3000/validationXML/cvs.xml", settings);

if (messages.Length > 0)
{
    
  Console.WriteLine(messages.ToString());
}
