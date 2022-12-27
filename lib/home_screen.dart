import 'package:flutter/material.dart';
import 'package:netflix_ui_clone/widgets/toprated.dart';
import 'package:tmdb_api/tmdb_api.dart';
import './widgets/trending.dart';
import './widgets/tv.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '0a6c9c9735aae54e3f1ff3819fbd0caa';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYTZjOWM5NzM1YWFlNTRlM2YxZmYzODE5ZmJkMGNhYSIsInN1YiI6IjYzYWE2ZWU5YjMzMTZiMDBhZTE2NDc4NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.jUCHoBtK7nuLZlnUkFKepQsEIrb9JMId6zt6iYJ54ZA';

  loadmovies() async {
    TMDB tmdbWithCutsomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingresult = await tmdbWithCutsomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCutsomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCutsomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/pngegg.png'),
      ),
      body: ListView(
        children: [
          TvScreen(tv: tv),
          TopRated(
            toprated: topratedmovies,
          ),
          TrendingMovies(
            trending: trendingmovies,
          ),
        ],
      ),
    );
  }
}
