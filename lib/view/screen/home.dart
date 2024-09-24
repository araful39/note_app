import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text(
          "Notes App",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: const Center(
        child: Text("Home"),
      ),
      floatingActionButton: IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.indigo),
          onPressed: () {},
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
