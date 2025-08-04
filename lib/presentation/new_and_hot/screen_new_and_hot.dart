import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix1/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix1/core/colors/colors.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/presentation/new_and_hot/widgets/comming_soon_widget.dart';
import 'package:netflix1/presentation/new_and_hot/widgets/everyons_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: kwhiteColor,
              ),
            ),
            actions: [
              const Icon(Icons.cast, color: Colors.white, size: 30),
              kwidth,
              Container(width: 30, height: 30, color: Colors.blue),
              kwidth,
            ],
            bottom: TabBar(
              unselectedLabelColor: kwhiteColor,
              isScrollable: true,
              labelColor: kBlackColor,
              dividerColor: kBlackColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicator: BoxDecoration(
                color: kwhiteColor,
                borderRadius: kRadius10,
              ),
              tabs: const [
                Text("🍿Comming Soon"),
                Text("👀Everyone's Watching"),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            CommingSoonList(key: Key('Comming_soon')),
            EveryOneIsWatchingList(key: Key('everyone_is_watching')),
          ],
        ),
      ),
    );
  }
}

class CommingSoonList extends StatelessWidget {
  const CommingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(
        context,
      ).add(const LoadDataIncommingSoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(
          context,
        ).add(const LoadDataIncommingSoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error!!! while loading comming soon list"),
            );
          } else if (state.commingSoonList.isEmpty) {
            return const Center(child: Text("Comming soon list is empty!!!"));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.commingSoonList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.commingSoonList[index];
                log(movie.overview.toString());

                if (movie.id == null) {
                  return const SizedBox();
                }
                String month = '';
                String date = '';
                try {
                  final _date = DateTime.parse(movie.releaseDate!);
                  final formattedDate = DateFormat.yMMMd('en_US').format(_date);
                  //log(formattedDate.toString());
                  month = formattedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase();
                  date = movie.releaseDate!.split('-')[1];
                } catch (_) {
                  month = '';
                  date = '';
                }

                return CommingSoonWidget(
                  id: movie.id.toString(),
                  month: month,
                  day: date,
                  movieName: movie.originalTitle ?? 'No Title',
                  description: movie.overview ?? 'No Discription',
                  backdropPath: '$imageAppendUrl${movie.backdropPath}',
                );
              },
            );
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(
        context,
      ).add(const LoadDataInEveryoneIsWtching());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(
          context,
        ).add(const LoadDataInEveryoneIsWtching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.hasError) {
            return const Center(
              child: Text("Error!!! while loading comming soon list"),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(child: Text("Comming soon list is empty!!!"));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (BuildContext context, index) {
                final movie = state.everyOneIsWatchingList[index];
                log(movie.overview.toString());

                if (movie.id == null) {
                  return const SizedBox();
                }

                final tv = state.everyOneIsWatchingList[index];
                return EveryonesWatchingWidget(
                  movieName: tv.originalName ?? 'No Name Provided!!',
                  description: tv.overview ?? 'No Discription',
                  backdropPath: '$imageAppendUrl${tv.backdropPath}',
                  posterPath: '',
                );
              },
            );
          }
        },
      ),
    );
  }
}
