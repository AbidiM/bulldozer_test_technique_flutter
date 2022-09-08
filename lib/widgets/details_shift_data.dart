import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsShiftData extends StatelessWidget {
  const DetailsShiftData({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(100.0),
              ),
              border: Border.all(color: Colors.black),
            ),
            alignment: Alignment.center,
            child: Icon(icon),
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: GoogleFonts.ptSerif(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
