import 'package:flutter/material.dart';
import 'package:movie_app/Screens/Search/screens/search_filter_screen.dart';
import 'package:movie_app/Screens/Search/widgets/container/button_column_widget.dart';
import 'package:movie_app/Screens/Search/widgets/buttons/buttons_see_more.dart';
import 'package:movie_app/Screens/Search/widgets/container/movie_lang_collection.dart';
import 'package:movie_app/assets/Colors/colors.dart';
import 'package:movie_app/widgets/SpaceWidgets/sized_box.dart';
import 'package:movie_app/widgets/Text_widgets/category_movie_heading.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
                  minLines: 1,
                  cursorColor: whiteColor,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchFilterScreen(),
                        ));
                  },
                  decoration: InputDecoration(
                      hintText: "Search by actor, title..",
                      prefixIcon: Icon(Icons.search, color: blackColor),
                      suffixIcon: Icon(Icons.mic_none, color: blackColor),
                      fillColor: whiteColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
              categoryHeadingText("Genres"),
              buttonsColumnWidget(),
              sizedBox(15, 0),
              seeMoreButton(),
              categoryHeadingText("Featured collections"),
              movieLangCollection(),
              sizedBox(10, 0),
              seeMoreButton(),
            ],
          ),
        ));
  }
}
