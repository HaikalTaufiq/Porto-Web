import 'package:flutter/material.dart';

class FishingGame extends StatelessWidget {
  const FishingGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white, // warna tombol back
        ),
        title: const Text(
          'FishingGame',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 91, 2, 94), // warna navbar
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Fishing Game page',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(
          255, 91, 2, 94), // warna background sama kayak section
    );
  }
}
