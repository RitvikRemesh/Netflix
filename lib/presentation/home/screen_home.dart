import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix1/application/home/home_bloc.dart';
import 'package:netflix1/core/colors/colors.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/presentation/home/widgets/background_card.dart';
import 'package:netflix1/presentation/home/widgets/number_title_card.dart';
import 'package:netflix1/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          "Error while getting data!!!",
                          style: TextStyle(color: kwhiteColor),
                        ),
                      );
                    }

                    // released past year
                    final _releasedPastYear = state.pastYearMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // trending
                    final _trending = state.trendingMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // drama
                    final _drama = state.tenseDramasMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();

                    // south indian
                    final _southIndian = state.southIndianMovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southIndian.shuffle();

                    // list view

                    return ListView(
                      children: [
                        const BackgroundCard(),
                        MainTitleCard(
                          title: "Released in the Past Year",
                          posterList: _releasedPastYear.length >= 10
                              ? _releasedPastYear.sublist(0, 10)
                              : _releasedPastYear,
                        ),
                        kheight,
                        MainTitleCard(
                          title: "Trending Now",
                          posterList: _trending.length >= 10
                              ? _trending.sublist(0, 10)
                              : _trending,
                        ),
                        kheight,
                        
                        const NumberTitleCard(),
                        kheight,
                        
                        MainTitleCard(
                          title: "Tense Dramas",
                          posterList: _drama.length >= 10
                              ? _drama.sublist(0, 10)
                              : _drama,
                        ),
                        kheight,
                        MainTitleCard(
                          title: "South Indian Cinema",
                          posterList: _southIndian.length >= 10
                              ? _southIndian.sublist(0, 10)
                              : _southIndian,
                        ),

                      ],
                    );
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: const Duration(microseconds: 1000),
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
                                  const Icon(
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
