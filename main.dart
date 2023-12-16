// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ludo/commonsquares.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LUDO',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int row = 15;
  int column = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LUDO"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: 300,
                height: 300,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: row,
                  ),
                  itemCount: row * column,
                  itemBuilder: (context, index) {
                    int columnIndex = index % column;
                    int rowIndex = (index / column).floor();
                    Color color;
                    if (columnIndex == 7 && rowIndex < row / 2) {
                      color = Colors.green;
                    } else if (rowIndex == 7 && columnIndex < column / 2) {
                      color = Colors.red;
                    } else if (columnIndex == 7) {
                      color = Colors.blue;
                    } else if (rowIndex == 7) {
                      color = Colors.yellow;
                    } else {
                      color = Colors.transparent;
                    }
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: color,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
                top: 121,
                right: 121,
                child: Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Stack(children: [
                      Positioned(
                        left: 16,
                        top: -10,
                        child: CircularWidget(
                          color: Colors.green,
                        ),
                      ),
                      Positioned(
                        top: 16,
                        left: -12,
                        child: CircularWidget(color: Colors.red),
                      ),
                      Positioned(
                          bottom: -10,
                          left: 16,
                          child: CircularWidget(color: Colors.blue)),
                      Positioned(
                          right: -12,
                          top: 16,
                          child: CircularWidget(color: Colors.yellow))
                    ]))),
            CustomContainer(RectColor: Colors.red, circleColor: Colors.red),
            Positioned(
              right: 0,
              child: CustomContainer(
                  RectColor: Colors.green, circleColor: Colors.green),
            ),
            Positioned(
              bottom: 0,
              child: CustomContainer(
                  RectColor: Colors.blue, circleColor: Colors.blue),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomContainer(
                  RectColor: Colors.yellow, circleColor: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }
}
