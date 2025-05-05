import 'package:flutter/material.dart';

class ServiceProviding extends StatelessWidget {
  const ServiceProviding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    size: 100,
                    color: Color(0xff55D3BD),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Visit Syria',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                child: Text(
                  'Service Type',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  // Handle button tap
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Colors.transparent, Color(0xff55D3BD)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Image.asset(
                          'assets/7xm.xyz505070.jpg',
                          width: 350,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 13,
                        left: 30,
                        child: Text(
                          'Hotel',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  // Handle button tap
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Colors.transparent, Color(0xff55D3BD)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Image.asset(
                          'assets/7xm.xyz472146.jpg',
                          width: 350,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 13,
                        left: 30,
                        child: Text(
                          'Resturant',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  // Handle button tap
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Colors.transparent, Color(0xff55D3BD)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: Image.asset(
                          'assets/7xm.xyz667851.jpg',
                          width: 350,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 13,
                        left: 30,
                        child: Text(
                          'Flight',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 20,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Send Request',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  backgroundColor: MaterialStateProperty.all(Color(0xff55D3BD)),
                  shadowColor: MaterialStateProperty.all(Color(0xff30323D)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
