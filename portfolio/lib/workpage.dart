import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/linelogoandbuttons/linelogolinks.dart';
import 'package:url_launcher/url_launcher.dart';
import 'linelogoandbuttons/barbuttons.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key, required this.isTapped});
  final bool isTapped;

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projectsData = [
      {
        "title": "Summarix",
        "subtitle": "AI-Powered Book Summarizer",
        "description":
            "Built a high-performance AI book summarization platform using Next.js App Router, TypeScript, and Gemini-1.5-Flash, optimized for scalability, low-latency inference, and UI reliability.",
        "details":
            " · Designed a custom JSON parsing and validation layer to sanitize AI-generated content, ensuring consistent schema integrity and stable rendering despite non-deterministic LLM outputs.\n · Integrated Gemini-1.5-Flash with structured schema orchestration to transform generative responses into strongly-typed React data models.\n · Developed resilient serverless API routes to aggregate external REST APIs and AI services, implementing robust error handling, rate limiting, and quota management.\n · Enforced end-to-end TypeScript type safety by modeling book metadata, chapter summaries, and analytical insights.",
        "languages": "Next.js, TypeScript, Gemini API, Serverless",
        "link": "https://summarix-one.vercel.app/",
        "color": Colors.indigoAccent,
      },
      {
        "title": "BlackHole",
        "subtitle": "High-Resolution Music Streaming",
        "description":
            "BlackHole is a high-resolution music streaming platform designed to deliver an ad-free listening experience without paid subscriptions. The product includes a Flutter-based mobile application and a web application developed using Next.js and TypeScript.",
        "details":
            " · Users can stream and download their favorite music for offline listening, import playlists from Spotify, JioSaavn, YouTube, and YouTube Music.\n · Store downloads directly on their device storage.\n · Seamless cross-platform access, high audio quality, and uninterrupted playback.",
        "languages":
            "Flutter, Hive, Next.js, TypeScript, API of (Spotify, Jio Savan, YouTube & YT Music)",
        "link": "https://blackhole-web.vercel.app/",
        "imagePath": "images/Images/blackhole.png",
        "color": Colors.deepPurpleAccent,
      },
      {
        "title": "Edukan App",
        "subtitle": "Order Management & Local Vendor Automation",
        "description":
            "I worked on a mobile based order management application. This application automates the process of ordering stuff from local vendors.",
        "details":
            " · Ability to place and track orders from a local vendor and share the payment and order receipts on app.\n · Reduces manual order tracking and management for vendors and customers.\n · Client-server architecture with Spring Boot REST API backed by MySQL database and Flutter based mobile app.",
        "languages": "Spring Boot, MySQL, Flutter",
        "color": Colors.deepOrangeAccent,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          LineLogoLinks(isTapped: true),
          DelayedDisplay(
            delay: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 20),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isDesktop = constraints.maxWidth > 900;

                  if (isDesktop) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                          child: Text(
                            'WORK',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 150,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 550,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              itemCount: projectsData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 500,
                                  margin: const EdgeInsets.only(right: 30),
                                  child: WorkCard(data: projectsData[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 70, top: 10, bottom: 10),
                          child: Text(
                            'WORK',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 80,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(
                                left: 70, right: 20, bottom: 20),
                            itemCount: projectsData.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 30),
                                child: WorkCard(data: projectsData[index]),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      appBar: Barbuttons(isTapped: true),
    );
  }
}

class WorkCard extends StatefulWidget {
  final Map<String, dynamic> data;
  const WorkCard({super.key, required this.data});

  @override
  State<WorkCard> createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool isHovered = false;
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    bool active = isHovered || isTapped;
    Color activeColor = widget.data['color'];

    return GestureDetector(
      onTap: () => setState(() => isTapped = !isTapped),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: active ? activeColor : Colors.white,
            border: Border.all(
              color: active ? activeColor : Colors.black87,
              width: 2,
            ),
            boxShadow: active
                ? [
                    BoxShadow(
                      color: activeColor.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    )
                  ]
                : [],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.data['title'],
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: active ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      if (widget.data['imagePath'] != null &&
                          widget.data['link'] != null)
                        GestureDetector(
                          onTap: () async {
                            final url = widget.data['link'];
                            if (await canLaunch(url)) {
                              await launch(url,
                                  forceWebView: true, enableJavaScript: true);
                            }
                          },
                          child: Image.asset(
                            widget.data['imagePath'],
                            width: 40,
                            height: 40,
                          ),
                        )
                      else if (widget.data['imagePath'] != null)
                        Image.asset(
                          widget.data['imagePath'],
                          width: 40,
                          height: 40,
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.data['subtitle'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: active ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    widget.data['description'],
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.4,
                      color: active ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.data['details'],
                    style: TextStyle(
                      fontSize: 16,
                      color: active
                          ? Colors.white.withOpacity(0.9)
                          : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "LANGUAGES & FRAMEWORKS",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.1,
                      color: active ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.data['languages'],
                    style: TextStyle(
                      fontSize: 16,
                      color: active ? Colors.white : Colors.black87,
                    ),
                  ),
                  if (widget.data['link'] != null) const SizedBox(height: 20),
                  if (widget.data['link'] != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () async {
                          final url = widget.data['link'];
                          if (await canLaunch(url)) {
                            await launch(url,
                                forceWebView: true, enableJavaScript: true);
                          }
                        },
                        icon: Icon(
                          Icons.open_in_new,
                          color: active ? Colors.white : activeColor,
                        ),
                        label: Text(
                          "Project Link",
                          style: TextStyle(
                            color: active ? Colors.white : activeColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: active
                              ? Colors.white.withOpacity(0.2)
                              : activeColor.withOpacity(0.1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
