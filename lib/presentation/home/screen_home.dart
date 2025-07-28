import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/presentation/home/widgets/background_card.dart';
import 'package:netflix1/presentation/home/widgets/number_title_card.dart';
import 'package:netflix1/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else {
                if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
              }
              return true;
            },
            child: Stack(
              children: [
                ListView(
                  children: [
                    BackgroundCard(),
                    MainTitleCard(title: "Released in the Past Year"),
                    kheight,
                    MainTitleCard(title: "Trending Now"),
                    kheight,

                    NumberTitleCard(),
                    kheight,

                    MainTitleCard(title: "Tense Dramas"),
                    kheight,
                    MainTitleCard(title: "South Indian Cinema"),
                  ],
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: Duration(microseconds: 1000),
                        width: double.infinity,
                        height: 100,
                        color: Colors.black.withOpacity(0.4),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https://i.pinimg.com/1200x/e9/88/40/e9884007598e2e329d53bb448ede4084.jpg",
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.cast,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  kwidth,
                                  Container(
                                    width: 30,
                                    height: 30,
                                    color: Colors.blue,
                                  ),
                                  kwidth,
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("TV Shows", style: kHomeTitleText),
                                Text("Movies", style: kHomeTitleText),
                                Text("Categories", style: kHomeTitleText),
                              ],
                            ),
                          ],
                        ),
                      )
                    : kheight,
              ],
            ),
          );
        },
      ),
    );
  }
}
