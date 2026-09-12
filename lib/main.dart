import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//membuat myapp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restoran Detail',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const RestoranDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//halaman detail restoran
class RestoranDetailPage extends StatelessWidget {
  const RestoranDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //membuat appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'La Brasserie Bistro',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,

      //membuat floating action button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reservasi berhasil dikirim!')),
          );
        },
        backgroundColor: Colors.green[600],
        icon: const Icon(Icons.calendar_today),
        label: const Text('Reservasi Sekarang'),
      ),

      //membuat body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //gambar restoran
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                'assets/restoran.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, eror, stackTrace) {
                  return Container(
                    color: Colors.orange[100],
                    child: const Icon(
                      Icons.restaurant,
                      size: 100,
                      color: Colors.orange,
                    ),
                  );
                },
              ),
            ),
            //container info utama
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //nama restoran dan rating restoran
                  Row(
                    children: [
                      const Text(
                        'La Brasserie Bistro',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '4.8',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[800],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  //kategori restoran
                  Row(
                    children: [
                      Icon(
                        Icons.restaurant_menu,
                        size: 18,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Westren • Bistro',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  //alamat restoran
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 18,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Jl. Kamang Raya No.43, Jakarta Selatan',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),

                  //statistik restoran
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem(
                        Icons.directions_walk,
                        '2.5 km',
                        'Jarak',
                        Colors.blue,
                      ),
                      _buildStatItem(
                        Icons.access_time,
                        '10:00 - 22:00',
                        'Jam Buka',
                        Colors.green,
                      ),
                      _buildStatItem(
                        Icons.money,
                        'Rp 130.00',
                        'Harga rata-rata',
                        Colors.orange,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  //Deskripsi restoran dengan maxLines dan overflow
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'La Brasserie Bistro menghadirkan pengalaman bersantap yang tak terlupakan dengan cita rasa khas Eropa yang otentik. '
                    'Menu-menu kami dibuat dari bahan-bahan segar pilihan dengan resep warisan keluarga. '
                    'Suasana restoran yang elegan dan nyaman cocok untuk berbagai momen spesial Anda.',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                      height: 1.6,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 24),

                  // Menu Populer
                  const Text(
                    'Menu Populer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildMenuCard(
                          'assets/steak.jpg',
                          'Grilled Sirloin Steak',
                          'Rp 145.000',
                          Colors.red,
                        ),
                        _buildMenuCard(
                          'assets/pasta.jpg',
                          'Truffle Carbonara',
                          'Rp 98.000',
                          Colors.yellow[700]!,
                        ),
                        _buildMenuCard(
                          'assets/salmon.jpg',
                          'Grilled Salmon',
                          'Rp 128.000',
                          Colors.orange,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //function untuk membuat item statistik
  Widget _buildStatItem(
    IconData icon,
    String value,
    String label,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: color,
            ),
          ),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  // Widget untuk Card Menu (menggunakan Stack)
  Widget _buildMenuCard(
    String imageUrl,
    String name,
    String price,
    Color color,
  ) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          // Card menu
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gambar card menu
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: color.withOpacity(0.3),
                          child: Icon(Icons.restaurant, size: 50, color: color),
                        );
                      },
                    ),
                  ),
                ),

                // Nama dan harga
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        price,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // tombol favorit
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Icon(
                Icons.favorite_border,
                size: 18,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
