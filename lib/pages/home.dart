import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moda/models/category_model.dart';
import 'package:moda/widgets/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [
    CategoryModel(image: 'assets/images/category/Women.png', name: 'Women'),
    CategoryModel(image: 'assets/images/category/Men.png', name: 'Men'),
    CategoryModel(image: 'assets/images/category/Kids.png', name: 'Kids'),
    CategoryModel(image: 'assets/images/category/Deals.png', name: 'Deals'),
    CategoryModel(image: 'assets/images/category/Health.png', name: 'Health'),
  ];
  late VideoPlayerController _controller;

  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((_) {
        setState(() {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // selectedFontSize: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 10,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
      appBar: CustomAppbar(
        title: "Runway",
        leading: "assets/svgs/menu.svg",
        action: "assets/svgs/notification.svg",
      ),
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20),
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Gap(30),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(categories.length, (index) {
                          final item = categories[index];

                          return Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/category',
                                    // arguments: item,
                                  );
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      item.image,
                                      width: 75,
                                      // height: 70,
                                      // fit: BoxFit.cover,
                                    ),

                                    Gap(5),
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        // color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
