import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class TextContainer extends StatelessWidget{
  const TextContainer({super.key});
  @override
  Widget build(context){
    return Text(
            'Learn flutter the fun way!',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 28,
      ),
    );
  }
}