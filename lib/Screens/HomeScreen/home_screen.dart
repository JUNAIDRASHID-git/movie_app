import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';
import 'package:movie_app/widgets/Bars/home_app_bar.dart';
import 'package:movie_app/widgets/Carousel_Slider/carousel_slider.dart';
import 'package:movie_app/widgets/Indicators/dot_indicators.dart';
import 'package:movie_app/widgets/Movie_widgets/movie_card.dart';
import 'package:movie_app/widgets/Text_widgets/category_movie_heading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselSliderController? carouselController =
      CarouselSliderController();
  ScrollController? scrollController = ScrollController();
  int _activeIndex = 2;
  int length = 5;

  late Future<List<MovieModel>> trendingMovies;
  late Future<List<MovieModel>> popularMovies;
  late Future<List<MovieModel>> topRatedMovies;
  late Future<List<MovieModel>> upcomingMovies;

  void updateState(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    trendingMovies = fetchMovies(Constant.trendingUrl);
    popularMovies = fetchMovies(Constant.popularUrl);
    topRatedMovies = fetchMovies(Constant.topRatedUrl);
    upcomingMovies = fetchMovies(Constant.upcomingMovieUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        homeSliverAppBar(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              carouselSlider(trendingMovies, context, carouselController,
                  updateState, length),
              const SizedBox(height: 10),
              dotIndicator(length, _activeIndex),
              categoryHeadingText("Popular Movies"),
              movieCardWidget(popularMovies, context),
              categoryHeadingText("TopRated Movies"),
              movieCardWidget(topRatedMovies, context),
              categoryHeadingText("Upcoming Movies"),
              movieCardWidget(upcomingMovies, context),
              categoryHeadingText("Upcoming Movies"),
              movieCardWidget(upcomingMovies, context),
            ],
          ),
        )
      ]),
    );
  }
}
