import 'package:flutter/material.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/api/movie_api.dart';

SizedBox searchResultContainer(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: ValueListenableBuilder(
      valueListenable: movieNotifier,
      builder: (context, value, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          padding: const EdgeInsets.all(8.0),
          itemCount: movieNotifier.value.length,
          itemBuilder: (context, index) {
            final movie = movieNotifier.value[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                child: Image.network(
                  "${Constant.imageBaseUrl}${movie.posterPath}",
                  fit: BoxFit.fill,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        color: Colors.grey,
                        size: 50,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
