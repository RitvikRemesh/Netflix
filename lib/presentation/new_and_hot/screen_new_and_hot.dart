import 'package:flutter/material.dart';
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
              Icon(Icons.cast, color: Colors.white, size: 30),
              kwidth,
              Container(width: 30, height: 30, color: Colors.blue),
              kwidth,
            ],
            bottom: TabBar(
              unselectedLabelColor: kwhiteColor,
              isScrollable: true,
              labelColor: kBlackColor,
              dividerColor: kBlackColor,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                color: kwhiteColor,
                borderRadius: kRadius10,
              ),
              tabs: [Text("🍿Comming Soon"), Text("👀Everyone's Watching")],
            ),
          ),
        ),
        body: TabBarView(
          children: [_buildCommingSoon(), _buildEveryonesWatching()],
        ),
      ),
    );
  }
}

Widget _buildCommingSoon() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, index) => const CommingSoonWidget(),
  );
}

Widget _buildEveryonesWatching() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, index) =>
        const EveryonesWatchingWidget(),
  );
}
