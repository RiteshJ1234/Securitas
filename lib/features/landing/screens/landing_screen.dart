import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:securitas/features/auth/screen/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigatedToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Welcome to Securitas",
              style: GoogleFonts.quicksand(
                  color: Colors.purple[300],
                  fontSize: 33,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/logo1.png"),
            const SizedBox(
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Note : When it comes to security You deserve the best.",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.purple[300],
                  fontSize: 18,

                  //fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => navigatedToLoginScreen(context),
              child: Container(
                height: 70,
                width: 270,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.purple[300],
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 5,
                        color: Color.fromRGBO(206, 147, 216, 1))
                  ],
                ),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
