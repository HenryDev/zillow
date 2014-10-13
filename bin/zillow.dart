import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
void main() {
  String apiId = 'insert api key here';
  String zpid = 'insert zpid here';
  var url = 'http://www.zillow.com/webservice/GetZestimate.htm?zws-id=${apiId}&zpid=${zpid}';
  http.get(url).then((response) {
    XmlDocument result = parse(response.body);
    var amount = result.findAllElements('amount');
    amount.map((node) => node.text).forEach(print);
  });
}
