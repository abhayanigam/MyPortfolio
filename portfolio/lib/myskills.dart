import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/linelogoandbuttons/linelogolinks.dart';
import 'linelogoandbuttons/barbuttons.dart';

class MySkillsPage extends StatefulWidget {
  const MySkillsPage({super.key, required this.isTapped});
  final bool isTapped;

  @override
  State<MySkillsPage> createState() => _MySkillsPageState();
}

class _MySkillsPageState extends State<MySkillsPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> skillsData = [
      {
        "title": "Spring Boot Developer",
        "description":
            "I love to create efficient and scalable backend solutions using clean code principles, Spring Boot, and MVC architecture. Experienced in Java and MongoDB, with a proven track record of building robust applications.",
        "likes":
            " · Clean Code\n · RESTful API Development\n · Security: Implementing authentication and authorization\n · Database Integration",
        "tools":
            " · VS Code · Eclipse ide · Intellij Idea Community Edition\n · Postman · CMD · VIM · NANO",
        "languages":
            " · Java · Spring Boot And Spring MVC \n· Apache Camel · Apache ActiveMQ · Kibana · Elasticsearch · Apache Cordova\n · MongoDB · MySQL · PostgreSQL · DBeaver,",
        "color": Colors.deepPurpleAccent,
      },
      {
        "title": "Flutter Developer",
        "description":
            "I specialize in developing Flutter applications, emphasizing clean and intuitive user interfaces. Skilled in Dart programming and crafting user-friendly mobile And web experiences.",
        "likes":
            " · Clean Code\n · Mobile Application\n · Web Application\n · Clean UI",
        "tools": " · VS Code · Android Studio · Xcode · CMD · Git & Github",
        "languages":
            "Riverpod State Management tool · Dart · Flutter · Firebase · Hive",
        "color": Colors.deepOrangeAccent,
      },
      {
        "title": "Next.js & TypeScript",
        "description":
            "Building high-performance, SEO-friendly web applications using Next.js and TypeScript. Focusing on server-side rendering and static site generation for optimal speed and user experience.",
        "likes":
            " · Server Components\n · App Router Architecture\n · Type Safety\n · Responsive Design",
        "tools": " · VS Code · Vercel · Chrome DevTools · Figma",
        "languages":
            "Redux Toolkit · TypeScript · React.js · Next.js · Tailwind CSS",
        "color": Colors.indigoAccent,
      },
      {
        "title": "AI Agents & Modern Tools",
        "description":
            "Developing intelligent applications by integrating LLMs like Gemini. Specialized in building AI agents that can perform complex tasks, structured data extraction, and process automation.",
        "likes":
            " · RAG Pipelines\n · Prompt Engineering\n · Function Calling\n · AI Orchestration",
        "tools": " · Google AI Studio · Postman · Docker",
        "languages": "Google ADK Toolkit · Python · Gemini API · LangChain ",
        "color": Colors.teal,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          LineLogoLinks(isTapped: false),
          DelayedDisplay(
            delay: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
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
                            'MY SKILLS',
                            style: TextStyle(
                              fontFamily: 'BebasNeue',
                              fontSize: 100,
                              color: Colors.grey.withOpacity(0.35),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 550,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              itemCount: skillsData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: (constraints.maxWidth / 2) - 40,
                                  margin: const EdgeInsets.only(right: 30),
                                  child: SkillCard(data: skillsData[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      padding: const EdgeInsets.only(
                          left: 70, right: 20, bottom: 20),
                      itemCount: skillsData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: SkillCard(data: skillsData[index]),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      appBar: Barbuttons(isTapped: false),
    );
  }
}

class SkillCard extends StatefulWidget {
  final Map<String, dynamic> data;
  const SkillCard({super.key, required this.data});

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
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
                  Text(
                    widget.data['title'],
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: active ? Colors.white : Colors.black,
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
                  const SizedBox(height: 25),
                  Text(
                    "I LIKE TO CREATE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.1,
                      color: active ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.data['likes'],
                    style: TextStyle(
                      fontSize: 16,
                      color: active ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "TOOLS",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.1,
                      color: active ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.data['tools'],
                    style: TextStyle(
                      fontSize: 16,
                      color: active ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
