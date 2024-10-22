import 'package:flutter/material.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';

SizedBox movieCardWidget(
    Future<List<MovieModel>> movieData, BuildContext context) {
  return SizedBox(
    height: 200,
    child: FutureBuilder(
      future: movieData,
      builder: (context, snapShot) {
        final movies = snapShot.data;
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 170,
            height: 100,
            color: Colors.transparent,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: 170,
                    height: 100,
                    child: Image.network(
                      "${Constant.imageBaseUrl}${movie.posterPath}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            itemCount: movies!.length,
          );
        }
      },
    ),
  );
}
