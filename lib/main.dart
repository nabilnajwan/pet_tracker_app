import 'package:flutter/material.dart';
import 'package:petfoodplanner/petfoodplannerscreen.dart';

//main() function to run app
void main() {
  runApp(const MainApp());
}
//provide base design
class MainApp extends StatelessWidget {
  const MainApp({super.key});

//splash screen
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SplashScreen());
  }
}
//state change
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    //wait 2 second before navigate to the next screen
    Future.delayed(const Duration(seconds: 2), () {
      //to go to my main screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Petfoodplannerscreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          //center the position
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //put title text
            Text(
              "PET FOOD PLANNER",
              //title text decoration
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 10),
            //loading animation
            CircularProgressIndicator(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

