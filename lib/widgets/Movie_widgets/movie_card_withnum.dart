import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';

SizedBox movieCardWidgetWithNum(
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
                      alignment: const Alignment(-1, 1),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:40.0),
                          child: Image.network(
                            "${Constant.imageBaseUrl}${movie.posterPath}",
                            width: 240,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          (index+1).toString(),
                          style: GoogleFonts.aDLaMDisplay(fontSize: 100,fontWeight: FontWeight.w900)
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
