import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storeapp/constants.dart';

class FlashChatLogo extends StatelessWidget {
  const FlashChatLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: "ONShoppPic",
          child: SvgPicture.asset(
            "assets/mobileShopping.svg",
            height: 150,
            width: 150,
          ),
        ),
        Text(
          "OnLine Shopping",
          style: GoogleFonts.pacifico(
            color: kPrimaryColor,
            fontSize: 32,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
