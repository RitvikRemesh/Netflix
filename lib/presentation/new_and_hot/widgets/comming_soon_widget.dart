import 'package:flutter/material.dart';
import 'package:netflix1/core/colors/colors.dart';
import 'package:netflix1/core/constants.dart';
import 'package:netflix1/presentation/home/widgets/custom_button_widget.dart';
import 'package:netflix1/presentation/widgets/video_widget.dart';

class CommingSoonWidget extends StatelessWidget {
  const CommingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Date column
          SizedBox(
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "FEB",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: kGreyColor,
                  ),
                ),
                Text(
                  "11",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 6,
                  ),
                ),
              ],
            ),
          ),

          // Right: Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image and volume icon
                const VideoWidget(),

                // Title and buttons
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "TALL GIRL 2",
                        style: TextStyle(
                          letterSpacing: -2,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        CustomButtonWidget(
                          icon: Icons.notifications,
                          title: "Remind Me",
                          iconSize: 25,
                          textSize: 10,
                        ),
                        kwidth,
                        CustomButtonWidget(
                          icon: Icons.info,
                          title: "Info",
                          iconSize: 25,
                          textSize: 10,
                        ),
                        kwidth,
                      ],
                    ),
                  ],
                ),
                kheight,
                const Text("Coming on Friday"),
                kheight,
                const Text(
                  "Tall Girl 2",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                kheight,
                const Text(
                  "Landing the lead in the school musical is a dream come true for Jodi, until the pressure sends confidence — and her relationship — into a tailspin.",
                  style: TextStyle(color: kGreyColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:netflix/core/colors/colors.dart';
// import 'package:netflix/core/constants.dart';
// import 'package:netflix/presentation/home/widgets/custom_button_widget.dart';

// class CommingSoonWidget extends StatelessWidget {
//   const CommingSoonWidget({
//     super.key,

//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Row(
//       children: [
//        SizedBox(
//          width: 50,
//          height: 450,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children:const [
//          Text("FEB",style: TextStyle(
//            fontWeight: FontWeight.w900,
//            fontSize: 16,
//            color: kGreyColor
//            ),
//            ),
//          Text("11",style: TextStyle(
//            fontWeight: FontWeight.bold,
//            fontSize: 30,
//            letterSpacing: 6
//            ),
//            )
//        ],),
//        ),
//         SizedBox(
//             width:size.width -50,
//             height: 450,
//             child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Stack(
//                  children: [
//                    SizedBox(
//                      width: double.infinity,
//                      height: 200,
//                      child: Column(
//                        children: [
//                          Image.network(newAndHotTempImage,
//                          fit: BoxFit.cover,
//                          ),
//                        ],
//                      ),
//                       ),
//                    Positioned(
//                      bottom: 10,
//                      right: 10,
//                      //top: 120,
//                      child: CircleAvatar(
//                                        radius: 22,
//                                        backgroundColor: Colors.black.withOpacity(0.5),
//                                        child: IconButton(
//                                          onPressed: (){},
//                                          icon: Icon(Icons.volume_off,
//                                          color: kwhiteColor,
//                                          size: 20,
//                                          ),
//                                          ),
//                                          ),
//                    ),
//                  ],
//                ),
//                Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: const [
//                    Text("TALL GIRL 2",
//                    style: TextStyle(
//                      letterSpacing: -2,
//                      fontWeight: FontWeight.bold,
//                      fontSize: 35,
//                      ),
//                    ),
//                    Spacer(),
//                    Row(
//                      children: [
//                        CustomButtonWidget(
//                          icon: Icons.notifications,
//                          title: "Read Me",
//                          iconSize: 25,
//                          textSize: 10,
//                          ),
//                          kwidth,
//                            CustomButtonWidget(
//                          icon: Icons.info,
//                          title: "Info",
//                          iconSize: 25,
//                          textSize: 10,
//                          ),
//                          kwidth,
//                      ],
//                    )
//                  ],
//                ),
//                kheight,
//               const Text("Comming on Friday"),
//               kheight,
//               const Text("Tall Girl 2",style: TextStyle(
//                fontSize: 18,
//                fontWeight: FontWeight.bold
//                ),
//                ),
//                kheight,
//               const Text("Landing the load in the school musical is a dream come true for jodi, until the pressure sends confidence - and her relationship - into a tailspain.",
//                style: TextStyle(color: kGreyColor),
//                )
//              ],
//             ),
//           ),
//       ],
//     );
//   }
// }
