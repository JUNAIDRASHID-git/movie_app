import 'package:flutter/material.dart';
import 'package:movie_app/assets/Colors/colors.dart';
import 'package:movie_app/widgets/SpaceWidgets/sized_box.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(""),
        actions: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Downloads",
              style: TextStyle(fontSize: 18),
            ),
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
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 225,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "No videos downloaded",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              sizedBox(10),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                          Color.fromARGB(255, 56, 56, 56)),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {},
                  child: Text(
                    "Find videos to download",
                    style: TextStyle(color: whiteColor),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("    Auto Downloads : On "),
                  sizedBox(0, 8),
                  const Icon(size: 5, Icons.circle),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Manage",
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
