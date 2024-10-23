import 'package:flutter/material.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';

SizedBox movieCardWidgetWithTitle(
    Future<List<MovieModel>> movieData, BuildContext context) {
  return SizedBox(
    height: 200,
    child: FutureBuilder(
      future: movieData,
      builder: (context, snapShot) {
        final movies = snapShot.data;
        if (snapShot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.transparent,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapShot.hasError) {
          return const Text("Api Error (Refresh)");
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
                    child: Stack(
                      alignment: const Alignment(-1.05, 1),
                      children: [
                        Image.network(
                          "${Constant.imageBaseUrl}${movie.posterPath}",
                          width: 230,
                          fit: BoxFit.fill,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.7),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child:  Text(
                            movie.originalLanguage!,
                            style:const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
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
