import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: (){
                Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
              },
              title: Text('Home', style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
            ),
            ListTile(
              title: Text('Doctors', style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
            ),
            ListTile(
              title: Text('Profile', style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
