import 'package:flutter/material.dart';
import 'package:personal_web/sections/project_detail/classroom.dart';
import 'package:personal_web/sections/project_detail/fish_feeder.dart';
import 'package:personal_web/sections/project_detail/fishing_game.dart';
import 'package:personal_web/sections/project_detail/garbage.dart';
import 'package:zo_animated_border/zo_animated_border.dart';

class MyProjectSection extends StatelessWidget {
  const MyProjectSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {
        "title": "Fish Feeder",
        "page": const FishFeederPage(),
        "icon": "assets/icons/mobile-development.png",
      },
      {
        "title": "Fishing Game",
        "page": const FishingGame(),
        "icon": "assets/icons/game-development.png",
      },
      {
        "title": "Garbage Payment",
        "page": const Garbage(),
        "icon": "assets/icons/web-programming.png",
      },
      {
        "title": "Classroom",
        "page": const Classroom(),
        "icon": "assets/icons/coding.png",
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        children: [
          Center(
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 60,
                  height: 1.4,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                ),
                children: [
                  TextSpan(
                    text: 'My ',
                    style: TextStyle(color: Color(0xff00E5FF)),
                  ),
                  TextSpan(
                    text: 'Project',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: projects.map((project) {
              return _ProjectCard(
                title: project['title'],
                destination: project['page'],
                icon: project['icon'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final Widget destination;
  final String icon;

  const _ProjectCard({
    Key? key,
    required this.title,
    required this.destination,
    required this.icon,
  }) : super(key: key);

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final hoverColor = _isHovering
        ? const Color(0xff00E5FF).withOpacity(0.35)
        : Color(0xff01323B);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.destination),
          );
        },
        child: ZoAnimatedGradientBorder(
          borderRadius: 20,
          borderThickness: 4,
          gradientColor: [
            Color.fromARGB(255, 2, 75, 88),
            Color(0xff00E5FF),
          ],
          duration: Duration(seconds: 60),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: hoverColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: _isHovering
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 14,
                        offset: const Offset(0, 8),
                      )
                    ]
                  : [],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.icon,
                  width: 80,
                  height: 80,
                  color: Colors.white,
                ),
                const SizedBox(height: 20),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
