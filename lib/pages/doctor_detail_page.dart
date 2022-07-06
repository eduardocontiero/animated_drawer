// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:animated_drawer/pages/doctor_page.dart';
import 'package:animated_drawer/utils/screen_size.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/doctor_model.dart';

class DoctorDetailPage extends StatelessWidget {
  const DoctorDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Doctor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(doctor.name, style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        width: screenWidth(context),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Theme.of(context).primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('start visit', style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
              Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    color: Theme.of(context).primaryColor,
                    size: 18,
                  )),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 45),
              width: screenWidth(context),
              height: screenHeight(context, dividedBy: 2.5),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    doctor.doctorProfileImage,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(doctor.name, style: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(doctor.expertise, style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                Text('9 years', style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                Text('4.7/5', style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 120,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const RadialGradient(radius: 2, colors: [
                  Color(0xffffffff),
                  Color.fromARGB(255, 209, 197, 126),
                ]),
              ),
              child: Center(child: Text("\$80/visit", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffA38B69)))),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 60),
              child: Text(doctor.description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    color: Colors.grey,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
