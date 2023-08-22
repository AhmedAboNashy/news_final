import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/model/SourcesResponse.dart';
import 'package:news/api/model/news_response.dart';

class ApiManager {
  static const String Base_url =
      'newsapi.org'; // mn elhagat elsabta f api web ely ana rayehlo
  static const String Api_key = '5f20b18586bf40e18217fbf878aedd36';
  static Future<SourcesResponse> getNewsSources() async {
    // https://newsapi.org  /v2/top-headlines/sources  ?apiKey=5f20b18586bf40e18217fbf878aedd36    & category =sports
    var uri = Uri.https(Base_url, '/v2/top-headlines/sources', {
      'apiKey': Api_key,
      'category': 'sports',

    });
    // authority--> el website ely ana rayehlo ely how newsapi.orgs
    // unencodepath--> /v2/top-headlines/sources

    var response = await http.get(uri);
    //3l4an ast5dm await laze block yb2a async
    var responsebody = response.body;
    //han5leeh jsondecode 3l4an nhwelooo l json 3l4an howa gay string
    var json = jsonDecode(responsebody);
    var sourcesResponse = SourcesResponse.fromJson(json);
    //hanhwel el data ely gaya mn api l json wn3ml pass l json(string)
    return sourcesResponse;
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
// https://  newsapi.org   /v2/everything    ? sources=bbc-sport  &   apiKey=5f20b18586bf40e18217fbf878aedd36

    var uri = Uri.https(
        Base_url, '/v2/everything', {'apikey': Api_key, 'sources': sourceId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
var newsResponse=NewsResponse.fromJson(json);

    return newsResponse;
  }
}
