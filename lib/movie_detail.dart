import 'package:flutter/material.dart';
import 'package:flutter_application_kobis/movie_api.dart';

class MovieDetail extends StatefulWidget {
  String movieCd;

  MovieDetail({super.key, required this.movieCd});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  build(BuildContext context) {
    var movieApi = MovieApi();
    var movie = movieApi.searchDetail(moviecode: widget.movieCd);

    return Scaffold(
        appBar: AppBar(title: const Text('영화 상세 정보')),
        body: FutureBuilder(
            future: movie,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
              if (snapshot.hasData) {
                var movieData = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Center(
                            child: Text(movieData['movieNm'],
                                style: const TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              '키워드 : ${movieData['typeNm']}',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }

              //error가 발생하게 될 경우 반환하게 되는 부분
              else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                    style: const TextStyle(fontSize: 15),
                  ),
                );
              }

              //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
              else {
                return const Center(child: CircularProgressIndicator());
              } // CircularProgressIndicator : 로딩 에니메이션
            }));
  }
}
