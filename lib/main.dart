import 'package:flutter/material.dart';

import 'package:animated_drawer/pages/doctor_detail_page.dart';

import 'pages/doctor_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      title: 'Animated Drawer Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color(0xff122B4B)),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/doctor': (context) => DoctorPage(),
        '/doctor-detail': (context) => DoctorDetailPage(),
      },
    );
  }
}
