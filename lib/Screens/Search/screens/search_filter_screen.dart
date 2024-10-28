import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Search/widgets/container/search_result_container.dart';
import 'package:movie_app/api/constant.dart';
import 'package:movie_app/api/movie_api.dart';
import 'package:movie_app/assets/Colors/colors.dart';
import 'package:movie_app/models/movie_model/movie_model.dart';
import 'package:movie_app/widgets/SpaceWidgets/sized_box.dart';

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  TextEditingController? searchController = TextEditingController();
  late Future<List<MovieModel>> searchMovieData;
  late Future<List<MovieModel>> defaultSearchData;
  String search = "Trending";

  @override
  void initState() {
    defaultSearchData = fetchMovies(Constant.trendingUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        actions: [
          sizedBox(0, 10),
          const Text(
            "Search",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.cast)),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              child: Image(
                height: 30,
                image: NetworkImage(
                  "https://media.istockphoto.com/id/470100848/vector/male-profile-icon-white-on-the-blue-background.jpg?s=612x612&w=0&k=20&c=2Z3As7KdHqSKB6UDBpSIbMkwOgYQtbhSWrF1ZHX505E=",
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: TextFormField(
                onChanged: (value) {
                  movieNotifier.value.clear();
                  searchMovies(value);
                  movieNotifier.notifyListeners;
                },
                controller: searchController,
                style: TextStyle(color: blackColor),
                decoration: InputDecoration(
                  hintText: "Search by actor, title..",
                  prefixIcon: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(Icons.arrow_back_ios_new_rounded,
                        color: blackColor, size: 19),
                  ),
                  suffixIcon: Icon(Icons.mic_none, color: blackColor),
                  fillColor: whiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            sizedBox(20, 0),
            searchResultContainer(context)
          ],
        ),
      ),
    );
  }
}
