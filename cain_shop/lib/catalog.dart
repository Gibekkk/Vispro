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
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.grey,
      ),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kCainGreyDark,
        title: const Text('Catalog'),
        leading: IconButton(
          icon: Image.asset(
            'open_door.png', // Ganti ini dengan gambar pintu kebuka lu
            width: 48,
            height: 48,
          ),
          onPressed: () {
            Navigator.pop(context); // Kembali ke layar login
          },
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Jumlah item per baris
          crossAxisSpacing: 10.0, // Jarak horizontal antar item
          mainAxisSpacing: 10.0, // Jarak vertikal antar item
          childAspectRatio: 3 / 4, // Rasio lebar-tinggi item
        ),
        itemCount: 8, // Jumlah total item di katalog
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productName: 'Cocaine Type ${index + 1}',
                    productImage: 'product.jpeg', // Dummy gambar
                    productPrice: (index + 1) * 10.0,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      'product.jpeg', // Ganti ini sesuai file gambar produk lu
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cocaine Type ${index + 1}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '\$${(index + 1) * 10}.00', // Harga dummy
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
    );
  }
}
