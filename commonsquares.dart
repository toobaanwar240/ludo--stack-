import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color RectColor;
  final Color circleColor;

  CustomContainer({required this.RectColor, required this.circleColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: RectColor,
            )),
        Positioned(
          left: 18,
          top: 16,
          //bottom: 10,
          //right: 10,
          child: Stack(
            children: [
              Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  )),
              Positioned(
                left: 9,
                top: 6,
                child: Column(
                  children: [
                    // Padding(padding: EdgeInsets.only(left: 5)),
                    Row(
                      children: [
                        CircularWidget(color: circleColor),
                        SizedBox(
                          width: 15,
                        ),
                        CircularWidget(color: circleColor),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircularWidget(color: circleColor),
                        SizedBox(
                          width: 15,
                        ),
                        CircularWidget(color: circleColor),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CircularWidget extends StatelessWidget {
  final Color color;

  CircularWidget({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color,
          border: Border.all(color: Colors.black)),
    );
  }
}
