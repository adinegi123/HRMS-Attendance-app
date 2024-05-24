import 'package:attendance_app/screens/dashboard/widget/attendance_calender.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  /*List imageList = [
    {"id": 1, "image_path": 'assets/images/carousel_img.jpg'},
    {"id": 2, "image_path": 'assets/images/carousel_img.jpg'},
    {"id": 3, "image_path": 'assets/images/carousel_img.jpg'}
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CarouselSlider(
          items: [1, 2, 3].map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Text $i",
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 100,
          ),
        ),
      ),
    );

    /*Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: imageList
                .map(
                  (item) => Image.asset(
                item['image_path'],
                width: 100,
                //height: 360,

              ),
            )
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
              //height: 360.0,
              scrollPhysics: const BouncingScrollPhysics(),
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              aspectRatio: 1,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return Container(
                    child: GestureDetector(
                      onTap: () => _controller.animateToPage(entry.key),
                      child: Container(
                        width: _currentIndex == entry.key ? 17 : 10,
                        height: 10.0,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 3.0,
                            vertical: 5
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _currentIndex == entry.key
                                ? Colors.white
                                : Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

        ],
      ),
    );*/
  }
}
