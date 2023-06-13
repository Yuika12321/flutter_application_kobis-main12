import 'package:flutter/material.dart';
import 'package:flutter_application_kobis/movie_detail.dart';

class Movie_Form extends StatelessWidget {
  Map<String, dynamic> movie;

  Movie_Form({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    /* var posters = movie['posters'].toString().isEmpty
        ? Image.asset('assets/images/no_image.png')
        : Image.network(movie['posters'].split('|')[0]); */
    var movieTitle = movie['movieNm'];

    //MovieApi movieApi = MovieApi();
    //var movies = movieApi.searchDetail(moviecode: movie['movieCd'].toString());
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MovieDetail(movieCd: movie['movieCd'].toString())));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
          width: double.infinity,
          height: 200,
          child: Row(
            children: [
              const SizedBox(
                width: 200,
                child: SizedBox(
                  child: Text('그림이 없어용'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$movieTitle (${movie['openDt']})',
                        style: const TextStyle(fontSize: 20)),
                    const Text('설명',
                        style: TextStyle(fontSize: 15, color: Colors.grey)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
