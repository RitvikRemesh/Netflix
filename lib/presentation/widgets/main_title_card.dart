import 'package:flutter/material.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/presentation/widgets/main_card.dart';
import 'package:netflix1/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.posterList,
  });

  final String title;
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length,
              (index) => MainCard(imageurl: posterList[index]),
            ),
          ),
        ),
      ],
    );
  }
}
