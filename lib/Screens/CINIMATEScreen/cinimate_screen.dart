import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';
import 'package:movie_app/widgets/Bars/home_app_bar.dart';
import 'package:movie_app/widgets/Buttons/button_widget.dart';
import 'package:movie_app/widgets/Carousel_Slider/carousel_slider.dart';
import 'package:movie_app/widgets/Indicators/dot_indicators.dart';
import 'package:movie_app/widgets/Movie_widgets/movie_card.dart';
import 'package:movie_app/widgets/Movie_widgets/movie_card_withtitle.dart';
import 'package:movie_app/widgets/SpaceWidgets/sized_box.dart';
import 'package:movie_app/widgets/Text_widgets/category_movie_heading.dart';

class CinimateScreen extends StatefulWidget {
  const CinimateScreen({super.key});

  @override
  State<CinimateScreen> createState() => _CinimateScreenState();
}

class _CinimateScreenState extends State<CinimateScreen> {
  final CarouselSliderController? carouselController =
      CarouselSliderController();
  ScrollController? scrollController = ScrollController();
  int _activeIndex = 2;
  int length = 5;

  late Future<List<MovieModel>> trendingMovies;
  late Future<List<MovieModel>> popularMovies;
  late Future<List<MovieModel>> topRatedMovies;
  late Future<List<MovieModel>> upcomingMovies;
  late Future<List<MovieModel>> nowPlayingMovies;

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
    nowPlayingMovies = fetchMovies(Constant.nowPlayingUrl);
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
              Row(
                children: [
                  buttonWidget("Movies", () {}),
                  buttonWidget("TV shows", () {}),
                ],
              ),
              sizedBox(10),
              carouselSlider(
                trendingMovies,
                context,
                carouselController,
                updateState,
                length,
              ),
              sizedBox(10),
              dotIndicator(length, _activeIndex),
              categoryHeadingText("Recomanded Movies"),
              movieCardWidget(topRatedMovies, context),
              categoryHeadingText("Watch in Your Language"),
              movieCardWidgetWithTitle(nowPlayingMovies, context),
              categoryHeadingText("Stories from the hearland >"),
              movieCardWidget(popularMovies, context),
              categoryHeadingText("Upcoming Movies"),
              movieCardWidget(upcomingMovies, context),
              sizedBox(10)
            ],
          ),
        )
      ]),
    );
  }
}
