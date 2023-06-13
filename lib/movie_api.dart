import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieApi {
  final api_key = '49e1567a35523dd0715681026c2fc1c0';

  Future<List<dynamic>> search({required String date}) async {
    String site =
        'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$api_key&targetDt=$date';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)['boxOfficeResult']
          ['dailyBoxOfficeList'] as List<dynamic>;
      return movies;
    } else {
      return [];
    }
  }

  Future<dynamic> searchDetail({required String moviecode}) async {
    String site =
        'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=$api_key&movieCd=$moviecode';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      var movies =
          jsonDecode(response.body)['movieInfoResult']['movieInfo'] as dynamic;
      return movies;
    } else {
      return [];
    }
  }
}
