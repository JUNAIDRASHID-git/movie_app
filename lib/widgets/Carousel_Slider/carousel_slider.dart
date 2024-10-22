import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';

FutureBuilder<List<MovieModel>> carouselSlider(
    Future<List<MovieModel>> trendingMovies,
    BuildContext context,
    CarouselSliderController? carouselController,
    Function updateState,
    int length) {
  return FutureBuilder<List<MovieModel>>(
    future: trendingMovies,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: SizedBox(child: CircularProgressIndicator()),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        final movies = snapshot.data!;
        return CarouselSlider.builder(
          carouselController: carouselController,
          itemCount: movies.length,
          itemBuilder: (context, index, realIndex) {
            final movie = movies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 350,
                  child: Image.network(
                    "${Constant.imageBaseUrl}${movie.posterPath}",
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            initialPage: 2,
            autoPlay: true,
            height: 170,
            onPageChanged: (index, reason) {
              updateState(index);
            },
          ),
        );
      } else {
        return const Center(
          child: Text('No movies found'),
        );
      }
    },
  );
}
