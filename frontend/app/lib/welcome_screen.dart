import 'package:app/pages/Service_provider/Authentication/login_page.dart';
import 'package:app/pages/User/Authentication/login_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.5, 1.0],
                colors: [
                  Colors.transparent,
                  Colors.white.withOpacity(0.8),
                  Colors.white,
                ],
              ),
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.srcOver,
            ),
            child: Image.asset(
              'assets/308 Palmyra  (Syria).jpeg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_sharp,
                  size: 100,
                  color: Color(0xff55D3BD),
                ),
                const Text(
                  'Welcome to',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      letterSpacing: 2),
                ),
                const Text(
                  "Syria",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      letterSpacing: 2),
                ),
                const SizedBox(
                  height: 300,
                ),
                const Text(
                  'Continue as',
                  style: TextStyle(
                      color: Color(0xff30323D),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 6,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserLoginPage()),
                    );
                  },
                  child: Text(
                    'User',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, letterSpacing: 2),
                  ),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(200, 50)),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff55D3BD)),
                      shadowColor:
                          MaterialStateProperty.all(Color(0xff30323D))),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProviderLoginPage()),
                    );
                  },
                  child: Text(
                    'Service Provider',
                    style: TextStyle(
                      color: Color(0xff55D3BD),
                      fontSize: 20,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    shadowColor: MaterialStateProperty.all(Color(0xff30323D)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
