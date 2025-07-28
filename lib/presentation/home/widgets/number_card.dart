import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix1/core/colors/colors.dart';
import 'package:netflix1/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(width: 40, height: 200),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://hippy.in/wp-content/uploads/2012/09/personalized-film-posters-1.jpg",
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 5,
          bottom: -39,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: kwhiteColor,

            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontSize: 140,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                decorationColor: Colors.white,
                color: kBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
