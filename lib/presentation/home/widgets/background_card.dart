import 'package:flutter/material.dart';
import 'package:netflix1/core/colors/colors.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/presentation/home/widgets/custom_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(kMainImage)),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(title: "My List", icon: Icons.add),
                _PlayButton(),
                const CustomButtonWidget(icon: Icons.info, title: "info"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

TextButton _PlayButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      backgroundColor: WidgetStatePropertyAll(kwhiteColor),
    ),
    icon: const Icon(Icons.play_arrow, size: 25, color: kBlackColor),

    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text("Play", style: TextStyle(fontSize: 20, color: kBlackColor)),
    ),
  );
}
