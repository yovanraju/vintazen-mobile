import 'package:flutter/material.dart';
import 'package:vintazen/screens/menu.dart';  
import 'package:vintazen/screens/productentry_form.dart';
// TODO: Impor halaman ProductEntryFormPage jika sudah dibuat


class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
    ),
    child: const Column(
      children: [
        Text(
          'Vintazen',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.all(8)),
        Text(
          "Ayo dapatkan produk yang kamu butuhkan disini!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    ),
          ),
  ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Halaman Utama'),
    // Bagian redirection ke MyHomePage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    },
  ),
  ListTile(
    leading: const Icon(Icons.add_shopping_cart),
    title: const Text('Tambah Product'),
    // Bagian redirection ke ProductEntryFormPage
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductEntryFormPage(),
        ),
      );
    },
  ),        ],
      ),
    );
  }
}