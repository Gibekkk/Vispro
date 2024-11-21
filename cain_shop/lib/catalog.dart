import 'dart:ui';
import 'package:cain_shop/login.dart';
import 'package:cain_shop/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:cain_shop/colors.dart';

void main() {
  runApp(const CatalogApp());
}

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cain Shop',
      debugShowCheckedModeBanner: false,
      home: const CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main Content (Behind Menu)
        Scaffold(
          backgroundColor: kCainBackgroundDark,
          appBar: AppBar(
            backgroundColor: kCainGreyDark,
            title: const Text(
              'Catalog',
              style: TextStyle(
                color: kCainGreyLight,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: _toggleMenu,
            ),
          ),
          body: GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 3 / 4,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailScreen(
                        productName: 'Product ${index + 1}',
                        productImage: 'product.jpeg', // Dummy gambar
                        productPrice: (index + 1) * 10.0,
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'product.jpeg', // Dummy gambar
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product ${index + 1}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '\$${(index + 1) * 10.0}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Hamburger Menu Slide (On Top)
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.translationValues(
            0,
            _isMenuOpen ? 0 : -MediaQuery.of(context).size.height, // Slide
            0,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Material(
              // Add Material widget here
              color: Colors.grey[900],
              child: Column(
                children: [
                  // Custom Shape with Close Button
                  Stack(
                    children: [
                      CustomPaint(
                        size: const Size(double.infinity, 40),
                        painter: TrianglePainter(),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: _toggleMenu,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Home', style: TextStyle(color: Colors.white)),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title:
                        Text('Settings', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text('Logout',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      // Pindah ke layar login
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey[800]!;

    final path = Path()
      ..moveTo(size.width * 0.5 - 20, 0)
      ..lineTo(size.width * 0.5, 20)
      ..lineTo(size.width * 0.5 + 20, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
