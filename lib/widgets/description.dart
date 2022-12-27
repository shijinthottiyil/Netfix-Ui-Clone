import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/utils/text.dart';

class Description extends StatelessWidget {
  String? name, description, bannerurl, posterurl, launchOn;
  double? vote;
  Description({
    super.key,
    this.name,
    this.description,
    this.bannerurl,
    this.vote,
    this.posterurl,
    this.launchOn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(children: [
            Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl ?? 'default',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: ModifiedText(
                    text: '⭐Avearge Rating:${vote ?? 'Rating is not defined'}',
                    size: 18,
                  ),
                ),
              ]),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                text: name ?? 'not Loaded',
                size: 24,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: 'Releasing on -${launchOn ?? 'defalut'}',
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl ?? 'default'),
                ),
                Flexible(
                  child: Container(
                    child: ModifiedText(
                      text: description ?? 'default',
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
