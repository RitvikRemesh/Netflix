import 'package:flutter/material.dart';
import 'package:netflix1/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT27vLYZmsiXe1zT5AVwbixSC5ypNNt20gcEQ&s",
          ),
        ),
      ),
    );
  }
}
