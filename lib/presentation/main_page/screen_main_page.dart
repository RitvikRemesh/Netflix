import 'package:flutter/material.dart';
import 'package:netflix1/presentation/downloads/screen_downloads.dart';
import 'package:netflix1/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix1/presentation/home/screen_home.dart';
import 'package:netflix1/presentation/main_page/widgets/bottom_navi.dart';
import 'package:netflix1/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix1/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
