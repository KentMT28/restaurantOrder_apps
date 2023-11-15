import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_and_order/components/button.dart';



class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Sample data for products
  List<Map<String, dynamic>> products = [
    {'name': 'Fanta', 'price': 8.000, 'image': 'images/Fanta.png'},
    {'name': 'CHIKI BALLS', 'price': 15.000, 'image': 'images/CIKI.png'},
    {'name': 'ULTRA MILK', 'price': 7.000, 'image': 'images/ULTRA.png'},
    {'name': 'TARO', 'price': 8.000, 'image': 'images/TARO.png'},
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // Warna latar belakang navigasi
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'ALFAGIFT KWS',
          style: TextStyle(color: const Color.fromARGB(255, 255, 252, 252)),
        ),
      ),
      backgroundColor: Colors.yellow[100], // Warna latar belakang daftar menu
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // promobanner
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 254, 253, 252),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Image next to "Get 32% Promo" text
                      Image.asset(
                        'images/ALFA.png', // Ganti dengan path gambar Anda
                        height: 50, // Sesuaikan tinggi sesuai kebutuhan
                      ),
                      const SizedBox(width: 20),
                      // Get 32% Promo text
                      Expanded(
                        child: Text(
                          'Get 40% Promo',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Redeem button
                      MyButton(
                        text: "CHECK",
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Follow button
                      IconButton(
                        icon: Icon(Icons.person_add),
                        color: Colors.grey[900],
                        onPressed: () {
                          // Handle follow action
                        },
                      ),
                      // Share button
                      IconButton(
                        icon: Icon(Icons.share),
                        color: Colors.grey[900],
                        onPressed: () {
                          // Handle share action
                        },
                      ),
                      // UI profil
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/PROFILE.png'), // Ganti dengan path gambar profil Anda
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 5, // Sesuaikan tinggi divider
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.yellow[200], // Warna neon
                borderRadius: BorderRadius.circular(10), // Sesuaikan bentuk ujung
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "PRODUCTS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
            // GridView.builder untuk menampilkan daftar produk
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              physics: NeverScrollableScrollPhysics(), // Agar tidak bisa di-scroll
              shrinkWrap: true, // Wrap content in SingleChildScrollView
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image produk
                        Image.asset(
                          products[index]['image'] ?? '',
                          height: 80,
                          width: 80,
                        ),
                        const SizedBox(height: 10),
                        // Detail produk
                        Text(
                          products[index]['name'] ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\$${products[index]['price'] ?? ''}',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 10),
                        // Tombol "Tambahkan ke Keranjang"
                        ElevatedButton(
                          onPressed: () {
                            // Tambahkan logika untuk menambahkan ke keranjang
                            // Contoh: print("Tambahkan ke Keranjang: ${products[index]['name']}");
                          },
                          child: Text("Tambahkan ke Keranjang"),
                        ),
                        // Add other details as needed
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
