import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';

import 'doctor_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,  
      body: Stack(
        children: [
          CustomDrawer(),
          DoctorPage()
        ],
      ),
    );
  }
}