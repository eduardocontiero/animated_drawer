// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_drawer/pages/doctor_page.dart';
import 'package:animated_drawer/utils/screen_size.dart';
import 'package:flutter/material.dart';
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
        title: Text('Dr Teste', style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor)),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
           Container(
                 margin: const EdgeInsets.symmetric(horizontal: 45),
                width: screenWidth(context),
                height: screenHeight(context, dividedBy: 2.5),
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(40)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(doctor.doctorProfileImage, fit: BoxFit.cover,))
                ,
              
            )
          ],
        ),
      ),
    );
  }
}