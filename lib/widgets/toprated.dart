import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/widgets/description.dart';

import '../utils/text.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(
          text: 'Top Rated Movies',
          size: 26,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: toprated.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Description(
                          name: toprated[index]['title'],
                          description: toprated[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          vote: toprated[index]['vote_average'],
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                          launchOn: toprated[index]['release_date'],
                        );
                      },
                    ),
                  );
                },
                child: toprated[index]['title'] != null
                    ? Container(
                        width: 140,
                        child: Column(children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      toprated[index]['poster_path']),
                            )),
                          ),
                          Container(
                            child: ModifiedText(
                                text: toprated[index]['title'] != null
                                    ? toprated[index]['title']
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
