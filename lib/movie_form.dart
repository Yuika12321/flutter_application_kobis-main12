import 'package:flutter/material.dart';
import 'package:flutter_application_kobis/movie_detail.dart';

class Movie_Form extends StatelessWidget {
  Map<String, dynamic> movie;

  Movie_Form({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var movieTitle = movie['movieNm'];
    var movieAcc = movie['salesAcc'];

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
              SizedBox(
                width: 200,
                child: SizedBox(
                  child: Text('${movie['rank']}위'),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!(movie['rankOldAndNew'].toString() == 'OLD'))
                      Text(
                        movie['rankOldAndNew'],
                        style: const TextStyle(color: Colors.red),
                      ),
                    Text(
                      '$movieTitle',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                        '개봉일 : ${movie['openDt'].toString().replaceAll('-', ' | ')}'),
                    Text('누적 매출액 : $movieAcc원'),
                    Text('누적 관객 수: ${movie['audiAcc']}'),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
