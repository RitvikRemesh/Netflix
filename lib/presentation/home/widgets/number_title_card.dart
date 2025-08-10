import 'package:flutter/material.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/presentation/home/widgets/number_card.dart';
import 'package:netflix1/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({super.key, required this.posterList});

  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: "Top 10 TV Shows in India Today"),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              posterList.length,
              (index) => NumberCard(index: index, imageUrl: posterList[index]),
            ),
          ),
        ),
      ],
    );
  }
}
