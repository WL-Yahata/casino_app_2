import 'package:flutter/material.dart';

class OwnersHomePage extends StatefulWidget {
  const OwnersHomePage({Key? key}) : super(key: key);

  @override
  State<OwnersHomePage> createState() => _OwnersHomePageState();
}

class _OwnersHomePageState extends State<OwnersHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('home', style: TextStyle(color: Colors.black54),),
        backgroundColor: Colors.white,
          elevation: 1,
      ),
    );
  }
}
