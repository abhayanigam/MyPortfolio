import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/linelogoandbuttons/linelogolinks.dart';

import 'linelogoandbuttons/barbuttons.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key, required this.isTapped});
  final bool isTapped;

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
                            'ABOUT',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: screenWidth > 600 ? 150 : 100,
                              color: Colors.grey,
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
                        width: screenWidth > 600? 500 : screenWidth * 0.5,
                        height: screenWidth > 600? 500 : screenWidth * 0.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).orientation == Orientation.landscape ? 50 : (screenWidth > 600 ? 130.0 : 20.0),
                        ),
                        child: Container(
                          width: screenWidth > 600 ? 900 : screenWidth * 0.8,
                          height: screenHeight > 600 ? 500 : screenHeight * 0.7,
                          padding: const EdgeInsets.all(40.0),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Text(
                                    'I\'m a web developer and react-native developer located in India. I love to create simple yet beautiful websites and mobile applications with great user experience.\n'+
                                        'I\'m interested in MERN stack and android development and like trying new things and building great projects. I\'m an independent freelancer.\n'+
                                        'I believe everything is an Art when you put your consciousness in it. You can connect with me via social links.',
                                    style: TextStyle(
                                      fontFamily: 'BebasNeue',
                                      fontSize: screenWidth > 600 ? 30 : 20,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
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
