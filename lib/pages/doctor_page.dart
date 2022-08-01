import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../utils/screen_size.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/doctors_list.dart';

import 'doctor_page.dart';

class DoctorPage extends StatefulWidget {
  DoctorPage({Key? key}) : super(key: key);

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  double _xOffset = 0;
  double _yOffset = 0;
  double _scaleFactor = 1;

  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(_xOffset, _yOffset, 0)..scale(_scaleFactor),
      duration: const Duration(milliseconds: 250),
      color: Colors.white,
      height: screenHeight(context),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Container(
                height: screenHeight(context, dividedBy: 2.6),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    color: Color(0xffFCD7E8), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))),
                child: Stack(
        
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _isDrawerOpen
                              ? IconButton(
                                  icon: const Icon(Icons.arrow_back_ios),
                                  onPressed: () {
                                    setState(() {
                                      _xOffset = 0;
                                      _yOffset = 0;
                                      _scaleFactor = 1;
        
                                      _isDrawerOpen = false;
                                    });
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.menu),
                                  onPressed: () {
                                   
                                    setState(() {
                                      _xOffset = 230;
                                      _yOffset = 150;
                                      _scaleFactor = 0.7;
        
                                      _isDrawerOpen = true;
                                    });
                                  },
                                ),
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80'),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Opacity(
                        opacity: 0.70,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(35)),
                          child: CustomPaint(
                            //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: MyCustomPainter(),
                            child: const SizedBox(
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(35)),
                        child: CustomPaint(
                          painter: MyCustomPainter(),
                          child: const SizedBox(
                            width: 200,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                            child: TextField(
                              style: TextStyle(color: Colors.grey[700]),
                             
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search condition or therapist',
                              
                                hintStyle: TextStyle(color: Colors.grey[700])
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Previous Visits', style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).primaryColor),),
                    ),
                      const SizedBox(height: 15,),
                     DoctorsList()
                  ],
                ),
              ),
             
        
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 247, 234, 241)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(size.width * 0.3, size.height);

    path.quadraticBezierTo(size.width * 0.4, -size.height * 0.4, size.width * 3, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
