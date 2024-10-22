import 'package:flutter/material.dart';
import 'package:movie_app/widgets/main_font_widget.dart';

SliverAppBar homeSliverAppBar() {
  return SliverAppBar(
    leading: const Text(""),
    floating: false,
    pinned: false,
    snap: false,
    flexibleSpace: FlexibleSpaceBar(
      titlePadding: const EdgeInsets.only(left: 10),
      title: Row(
        children: [
          mainFontWidget(20), // Your leading widget here
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
    ),
  );
}
