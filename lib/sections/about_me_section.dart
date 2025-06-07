import 'dart:ui';

import 'package:flutter/material.dart';

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({Key? key}) : super(key: key);

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;

  List<String> imagePaths = [
    'assets/images/sertif-RV.jpg',
    'assets/images/sertif-2.png',
    'assets/images/sertif-IT.jpg',
    'assets/images/MTKH.png',
    'assets/images/sertif-ML.jpg',
    'assets/images/sertif-KR.jpg',
  ];

  final List<String> certificateTitles = [
    'RevoU Software Engineering Online Course – 2023',
    '2nd Place Winner of PBL EXPO Polibatam – 2024',
    'Coursera Tech Support Online Course – 2023',
    'Participant of PBL EXPO Polibatam – 2024',
    'MindLuster Online Course – 2023',
    'National Seminar INSYFEST – 2024',
  ];

  final List<String> details = [
    'Participated in a two-week intensive learning program organized by RevoU, focusing on the fundamentals of Software Engineering. The course covered an introduction to front-end and back-end development, using HTML, CSS, and JavaScript to build basic web applications, including a simple BMI calculator project deployed for free via GitHub Pages.',
    'Participated in the 2024 PBL Expo under the Web & Mobile Application category by developing an IoT-based mobile application designed for automatic fish feeding. The app enables users to remotely control and monitor feeding schedules through a smart device. This project was awarded 2nd place in the competition for its innovation and practical application in the aquaculture field.',
    'Completed an online course on Tech Support Fundamentals authorized by Google and offered through Coursera. This course covered the basics of technical support, including computer hardware and software, operating systems, basic troubleshooting, networking services, and best practices for delivering effective IT support to end-users.',
    'Participated as an exhibitor in the PBL Expo at Politeknik Negeri Batam under the Web & Mobile Application category. I developed and presented a mobile application product integrated with Internet of Things (IoT) technology that functions as an automatic fish feeder system.',
    'Completed an online class on the MindLuster platform with the topic of Responsive Design. In this course, I learned the fundamental principles of responsive web design, including how to create adaptive user interfaces across various screen sizes, the use of media queries, modern layout techniques such as Flexbox and Grid, and best practices for enhancing user experience (UX) across multiple devices.',
    'Participated in the national seminar INSYFEST, organized by the Information Systems Student Association, focusing on globally competitive web development. The seminar explored how web developers can make meaningful contributions in both corporate and educational environments by applying cutting-edge technologies, adhering to industry standards, and understanding global user needs.',
  ];

  double scrollSpeed = 3.0; // pixel per second

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(hours: 1),
    )..addListener(_scroll);

    _animationController.repeat();
  }

  void _scroll() {
    if (_scrollController.hasClients) {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.offset;
      double newScroll = currentScroll + scrollSpeed;

      if (newScroll >= maxScroll) {
        _scrollController.jumpTo(0); // Loop ke awal
      } else {
        _scrollController.jumpTo(newScroll);
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allImages = [
      ...imagePaths,
      ...imagePaths,
      ...imagePaths,
      ...imagePaths
    ];

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 100, left: 40),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 60,
                      height: 1.4,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Poppins',
                    ),
                    children: [
                      TextSpan(
                        text: 'About ',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'Me',
                        style: TextStyle(color: Color(0xff00E5FF)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 45, top: 10, left: 15),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.4,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                      ),
                      children: [
                        TextSpan(
                          text: 'My name is M Taufiq Karim ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Haikal ',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                        TextSpan(
                          text: 'I am an undergraduate student majoring in ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Multimedia',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                        TextSpan(
                          text:
                              ' Engineering Technology student at Politeknik Negeri',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: ' Batam, ',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                        TextSpan(
                          text: 'experienced in web ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'development, ',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                        TextSpan(
                          text:
                              'mobile apps, IoT product development, including designing and programming smart devices for various applications. and 3D ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'game ',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                        TextSpan(
                          text:
                              'creation. I combine technical skills in front-end and back-end',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: ' development ',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                        TextSpan(
                          text: 'with a creative approach to',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: ' multimedia ',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                        TextSpan(
                          text: 'solutions, driven by continuous learning and ',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: 'innovation.',
                          style: TextStyle(color: Color(0xff00E5FF)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Certificate :',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 60, left: 10),
                          child: ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: allImages.length,
                            itemBuilder: (context, index) {
                              int actualIndex = index %
                                  imagePaths.length; // sesuai gambar asli
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierColor: Colors.black.withOpacity(
                                          0.5), // semi transparant background
                                      builder: (context) => BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 1500,
                                              maxHeight: 1400,
                                            ),
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                              color: Colors.black87
                                                  .withOpacity(0.85),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                    child: Image.asset(
                                                      imagePaths[actualIndex],
                                                      fit: BoxFit.contain,
                                                      width: 800,
                                                      height: 700,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 80,
                                                        ),
                                                        Text(
                                                          certificateTitles[
                                                              actualIndex],
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Poppins",
                                                            color: Colors.white,
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            height: 20),
                                                        Text(
                                                          details[actualIndex],
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              color: const Color
                                                                  .fromARGB(
                                                                  179,
                                                                  255,
                                                                  255,
                                                                  255),
                                                              fontSize: 16,
                                                              height: 1.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                        const SizedBox(
                                                            height: 30),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: const Text(
                                                              'Close',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Poppins",
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: HoverImageCard(
                                    imagePath: allImages[actualIndex],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HoverImageCard extends StatefulWidget {
  final String imagePath;

  const HoverImageCard({Key? key, required this.imagePath}) : super(key: key);

  @override
  _HoverImageCardState createState() => _HoverImageCardState();
}

class _HoverImageCardState extends State<HoverImageCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              widget.imagePath,
              width: 350,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          // Blue filter overlay saat tidak hover
          if (!_isHovering)
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
                  ),
                ),
              ),
            ),
          // Blur overlay saat hover
          if (!_isHovering)
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
