import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/linelogoandbuttons/linelogolinks.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'cardswips.dart';
import 'linelogoandbuttons/barbuttons.dart';

class ExpPage extends StatefulWidget {
  const ExpPage({super.key, required this.isTapped});
  final bool isTapped;

  @override
  State<ExpPage> createState() => _ExpPageState();
}

class _ExpPageState extends State<ExpPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          LineLogoLinks(isTapped: true),
          DelayedDisplay(
            delay: const Duration(milliseconds: 500),
            child: Stack(
              children: [
                Row(
                  verticalDirection: VerticalDirection.down,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: screenWidth > 600
                          ? const EdgeInsets.fromLTRB(50, 10, 10, 50)
                          : const EdgeInsets.fromLTRB(20, 10, 10, 50),
                      child: Positioned(
                        child: DelayedDisplay(
                          delay: const Duration(milliseconds: 500),
                          child: Text(
                            'Exp.',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: screenWidth > 600 ? 150 : 100,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: DelayedDisplay(
                      delay: const Duration(milliseconds: 1000),
                      child: Image.asset(
                        'images/Images/spaceman.png',
                        width: screenWidth > 600 ? 500 : screenWidth * 0.5,
                        height: screenWidth > 600 ? 500 : screenWidth * 0.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).orientation == Orientation.landscape
                              ? 50
                              : (screenWidth > 600 ? 130.0 : 20.0),
                        ),
                        child: SizedBox(
                          height: 500, // Adjust height as necessary
                          child: CardSwip(),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      appBar: Barbuttons(isTapped: true),
    );
  }
}


