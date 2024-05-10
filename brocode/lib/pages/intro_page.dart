import 'package:flutter/material.dart';
import 'package:brocode/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimationIcon;
  late Animation<double> _fadeAnimationIcon;
  late Animation<Offset> _slideAnimationText;
  late Animation<double> _fadeAnimationText;
  late Animation<Offset> _slideAnimationButton;
  late Animation<double> _fadeAnimationButton;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Icon animations
    _slideAnimationIcon = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0, 0.33,
        curve: Curves.easeOut,
      ),
    ));

    _fadeAnimationIcon = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0, 0.33,
        curve: Curves.easeIn,
      ),
    ));

    // Text animations
    _slideAnimationText = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.33, 0.66,
        curve: Curves.easeOut,
      ),
    ));

    _fadeAnimationText = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.33, 0.66,
        curve: Curves.easeIn,
      ),
    ));

    // Button animations
    _slideAnimationButton = Tween<Offset>(
      begin: const Offset(-1.5, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.66, 1.0,
        curve: Curves.easeOut,
      ),
    ));

    _fadeAnimationButton = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.66, 1.0,
        curve: Curves.easeIn,
      ),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: _slideAnimationIcon,
                child: FadeTransition(
                  opacity: _fadeAnimationIcon,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.code,
                        color: Colors.black,
                        size: 80,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'BroCode',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SlideTransition(
                position: _slideAnimationText,
                child: FadeTransition(
                  opacity: _fadeAnimationText,
                  child: const Text(
                    'bro together code together',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueGrey,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SlideTransition(
                position: _slideAnimationButton,
                child: FadeTransition(
                  opacity: _fadeAnimationButton,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 12),
                      child: const Center(
                        child: Text(
                          'Enter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
