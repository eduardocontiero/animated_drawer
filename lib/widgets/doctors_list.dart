import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../mocks/mocks.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xffF1F6F7).withOpacity(0.7),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: doctors[index].doctorProfileImage,
                    width: 85,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctors[index].name,
                        style: GoogleFonts.roboto(fontSize: 19, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Condition: ${doctors[index].expertise}",
                        style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        doctors[index].visitDate,
                        style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Color(0xffF1F6F7),
                        )),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
