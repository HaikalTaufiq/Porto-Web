import 'package:flutter/material.dart';

class Garbage extends StatelessWidget {
  const Garbage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white, // warna tombol back
        ),
        title: const Text(
          'Garbage',
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
          'Garbage page',
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
