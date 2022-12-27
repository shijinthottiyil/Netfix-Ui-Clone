import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/widgets/description.dart';

import '../utils/text.dart';

class TvScreen extends StatelessWidget {
  final List tv;

  const TvScreen({super.key, required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(
          text: 'Popular TV Shows',
          size: 26,
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tv.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Description(
                          name: tv[index]['name'] ?? 'no name',
                          description:
                              tv[index]['overview'] ?? 'no description',
                          bannerurl:
                              'https://image.tmdb.org/t/p/w500${tv[index]['backdrop_path'] ?? 'https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'}',
                          posterurl:
                              'https://image.tmdb.org/t/p/w500${tv[index]['poster_path'] ?? 'https://image.tmdb.org/t/p/w500/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'}',
                          launchOn: 'Not Defined',
                        );
                      },
                    ),
                  );
                },
                child: tv[index]['original_name'] != null
                    ? Container(
                        padding: EdgeInsets.all(5),
                        width: 250,
                        child: Column(children: [
                          Container(
                            width: 250,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500' +
                                        tv[index]['poster_path']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ModifiedText(
                                text: tv[index]['original_name'] != null
                                    ? tv[index]['original_name']
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
