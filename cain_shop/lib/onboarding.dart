import 'package:cain_shop/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cain_shop/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    OnboardingPage(
      lottieFile: 'assets/animation1.json',
      title: 'Welcome to CAIN Shop',
      description: 'The only official and legal drug shopping platform.',
    ),
    OnboardingPage(
      lottieFile: 'assets/animation2.json',
      title: 'Find Your Favorite',
      description: 'Discover new weeds and shop your favorite products.',
    ),
    OnboardingPage(
      lottieFile: 'assets/animation3.json',
      title: 'Start Ordering',
      description: 'Let’s get started and find your best taste ever!',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginApp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCainBackgroundDark,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: _pages,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Tombol ke kanan
              children: [
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: kCainGreyMedium),
                  child: Text(
                    _currentPage < _pages.length - 1 ? 'Next' : 'Start',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String lottieFile;
  final String title;
  final String description;

  const OnboardingPage(
      {super.key,
      required this.lottieFile,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.grey.withOpacity(1), // Ganti ke warna hitam-abu
              BlendMode.srcIn, // Ganti warna animasi
            ),
            child: Lottie.asset(
              lottieFile,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
