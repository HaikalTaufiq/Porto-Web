import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zo_animated_border/zo_animated_border.dart';
import 'sections/about_me_section.dart';
import 'sections/my_project_section.dart';
import 'sections/contact_section.dart';
import 'dart:math' as math;
import 'dart:ui';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _isHovering = false;

  void _scrollToSection(int index) {
    setState(() {
      selectedIndex = index;
    });

    final double appBarHeight = 0;
    final double position =
        (index * MediaQuery.of(context).size.height) - appBarHeight;

    _scrollController.animateTo(
      position < 0 ? 0 : position,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(-290, -330),
      end: const Offset(-20, -600),
    ).chain(CurveTween(curve: Curves.easeInOutBack)).animate(_controller);
  }

  void _onScroll() {
    final position = _scrollController.offset;
    if (position < 500) {
      _updateSelectedIndex(0);
    } else if (position >= 500 && position < 1000) {
      _updateSelectedIndex(1);
    } else if (position >= 1000 && position < 1500) {
      _updateSelectedIndex(2);
    } else {
      _updateSelectedIndex(3);
    }
  }

  void _updateSelectedIndex(int index) {
    if (selectedIndex != index) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Positioned.fill(
              child: Stack(
                children: [
                  Positioned(
                    top: 100,
                    right: -500,
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: _animation.value,
                          child: Image.asset(
                            'images/Ellipse.png',
                            width: 1100,
                            height: 1100,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // ====== Konten scrollable (konten berubah, bg tetap) ======
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(
                      height: 150), // offset top agar tidak ketutupan AppBar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: ZoAnimatedGradientBorder(
                                borderRadius: 20,
                                borderThickness: 1,
                                gradientColor: [
                                  Color(0xff00E5FF),
                                ],
                                duration: Duration(seconds: 20),
                                child: Container(
                                  width: 10,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: Color(0xff00E5FF),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, I'm",
                                  style: TextStyle(
                                    fontSize: 40,
                                    height: 1.2,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
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
                                        text: 'Haikal ',
                                        style:
                                            TextStyle(color: Color(0xff00E5FF)),
                                      ),
                                      TextSpan(
                                        text: 'Taufiq',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Software ',
                                      style: TextStyle(
                                        fontSize: 60,
                                        height: 1,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    ),
                                    AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                        TypewriterAnimatedText('Developer',
                                            textStyle: TextStyle(
                                              fontSize: 60,
                                              height: 1,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              color: Color(0xff00E5FF),
                                            ),
                                            speed: Duration(milliseconds: 250),
                                            cursor: "|",
                                            curve: Curves.bounceIn),
                                        TypewriterAnimatedText('Engineer',
                                            textStyle: TextStyle(
                                              fontSize: 60,
                                              height: 1,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              color: Color(0xff00E5FF),
                                            ),
                                            speed: Duration(milliseconds: 250),
                                            cursor: "|",
                                            curve: Curves.bounceInOut),
                                      ],
                                      pause: Duration(milliseconds: 1500),
                                      displayFullTextOnTap: true,
                                      stopPauseOnTap: true,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 20,
                                      height: 1.5,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                    children: [
                                      TextSpan(text: ' I am a '),
                                      TextSpan(
                                        text: 'Multimedia',
                                        style:
                                            TextStyle(color: Color(0xff00E5FF)),
                                      ),
                                      TextSpan(
                                          text:
                                              ' Engineering Technology student at\n '),
                                      TextSpan(text: 'Politeknik Negeri '),
                                      TextSpan(
                                        text: 'Batam',
                                        style:
                                            TextStyle(color: Color(0xff00E5FF)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 25,
                                  ),
                                  child: MouseRegion(
                                    onEnter: (_) =>
                                        setState(() => _isHovering = true),
                                    onExit: (_) =>
                                        setState(() => _isHovering = false),
                                    child: GestureDetector(
                                      onTap: () => _scrollToSection(1),
                                      child: ZoAnimatedGradientBorder(
                                        borderRadius: 20,
                                        borderThickness: 2,
                                        gradientColor: [
                                          Color(0xff01323B),
                                          Color(0xff00E5FF),
                                          Color.fromARGB(255, 124, 241, 254),
                                        ],
                                        duration: Duration(seconds: 20),
                                        child: AnimatedContainer(
                                          width: 180,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: _isHovering
                                                  ? const Color(0xff00E5FF)
                                                  : const Color.fromARGB(
                                                      255, 24, 232, 255),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40))),
                                          duration:
                                              const Duration(milliseconds: 200),
                                          child: Center(
                                            child: Text(
                                              "Let's Start ->",
                                              style: TextStyle(
                                                shadows: [
                                                  Shadow(
                                                    color: const Color.fromARGB(
                                                        255, 1, 202, 237),
                                                    offset: Offset(0, 0),
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                color: Colors.white,
                                                fontFamily: "Poppins",
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        Positioned(
                          right: 80,
                          child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi),
                            child: Lottie.asset(
                              'assets/json/pp.json',
                              width: 400,
                              height: 400,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 150),

                  const AboutMeSection(),
                  const SizedBox(height: 100),

                  const MyProjectSection(),
                  const ContactSection(),
                ],
              ),
            ),

            // ====== AppBar transparan dengan blur ======
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    height: 80,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => _scrollToSection(0),
                          child: Row(
                            children: const [
                              Text(
                                'Haikal',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff00E5FF),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Taufiq',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            _buildNavButton('About Me', 1),
                            const SizedBox(width: 30),
                            _buildNavButton('My Project', 2),
                            const SizedBox(width: 30),
                            _buildNavButton('Contact', 3),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, int index) {
    return _NavButton(
      label: label,
      index: index,
      isSelected: selectedIndex == index,
      onTap: () => _scrollToSection(index),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String label;
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavButton({
    required this.label,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    Color textColor;

    if (widget.isSelected || _isHovering) {
      textColor = const Color(0xFF00E5FF);
    } else {
      textColor = Colors.white;
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          child: Text(widget.label),
        ),
      ),
    );
  }
}
