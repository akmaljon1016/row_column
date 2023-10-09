import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              AnimatedPositioned(
                left: x,
                top: y,
                duration: Duration(milliseconds: 1000),
                child: GestureDetector(
                  onPanUpdate: (value) {
                    setState(() {
                      x = x + value.delta.dx;
                      y = y + value.delta.dy;
                    });
                  },
                  onPanEnd: (value){
                   setState(() {
                     x=0;
                     y=0;
                   });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
