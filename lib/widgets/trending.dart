import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/widgets/description.dart';

import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(
          text: 'Trending Movies',
          size: 26,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Description(
                          name: trending[index]['title'],
                          description: trending[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['backdrop_path'],
                          vote: trending[index]['vote_average'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              trending[index]['poster_path'],
                          launchOn: trending[index]['release_date'],
                        );
                      },
                    ),
                  );
                },
                child: trending[index]['title'] != null
                    ? Container(
                        width: 140,
                        child: Column(children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      trending[index]['poster_path']),
                            )),
                          ),
                          Container(
                            child: ModifiedText(
                                text: trending[index]['title'] != null
                                    ? trending[index]['title']
                                    : 'Loading'),
                          ),
                        ]),
                      )
                    : Container(),
              );
            },
          ),
        ),
      ]),
    );
  }
}
