import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/pages/category/category_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          gradient: appMainGradient),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Image.asset("assets/images/home/family.jpg",
                            fit: BoxFit.fill),
                      ),
                    ),
                    buildCard("Erkaklar uchun", appMainGradient,
                        () => {menPage(context)}),
                    buildCard("Ayollar uchun", appMainGradient,
                        () => {womenPage(context)}),
                    buildCard("Bolalar uchun", appMainGradient,
                        () => {childrenPage(context)})
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void womenPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryPage(
                  type: "women",
                  categories: const [
                    "Sumkalar",
                    "Ko'ylaklar",
                    "Taqinchoqlar",
                    "Atirlar",
                    "Oyoq kiyimlar"
                  ],
                )));
  }

  void menPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryPage(
                  type: "men",
                  categories: const [
                    "Shimlar",
                    "Ko'ylaklar",
                    "Oyoq kiyimlar",
                    "Soatlar"
                  ],
                )));
  }

  void childrenPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryPage(
                  type: "children",
                  categories: const [
                    "Ko'ylaklar",
                    "Oyoq kiyimlar",
                    "O'yinchoqlar"
                  ],
                )));
  }

  Container buildCard(
      String text, LinearGradient gradient, VoidCallback press) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: SizedBox(
        height: 100,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          onPressed: press,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), gradient: gradient),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lobsterTwo(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
