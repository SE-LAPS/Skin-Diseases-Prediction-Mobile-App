import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 932,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFFF496D5), Color(0x00DAD4DA)],
        ),
      ),
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left: 88,
              top: 91,
              child: Text(
                'SKINDOC',
                style: TextStyle(
                  color: Color(0xFF736C6C),
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 143,
              child: SizedBox(
                width: 303,
                height: 18,
                child: Text(
                  'because your skin deserve the best care',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 170,
              child: Container(
                width: 366,
                height: 561,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Color(0xFFF6BEF7), Color(0xFFFEF0FF)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 371,
              child: Container(
                width: 366,
                height: 110,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFF1FF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFC03C5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 310,
              top: 104,
              child: Opacity(
                opacity: 0.30,
                child: Container(
                  width: 22,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 310,
              top: 110,
              child: Opacity(
                opacity: 0.30,
                child: Container(
                  width: 22,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 310,
              top: 116,
              child: Opacity(
                opacity: 0.30,
                child: Container(
                  width: 22,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 346,
              top: 91,
              child: Container(
                width: 37,
                height: 37,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/37x37"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 170,
              child: Container(
                width: 366,
                height: 184,
                decoration: ShapeDecoration(
                  color: Color(0xFFFEF1FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 64,
              top: 248,
              child: SizedBox(
                width: 190,
                height: 36,
                child: Text(
                  'beauty never been so easy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 64,
              top: 211,
              child: Text(
                'SKINDOC',
                style: TextStyle(
                  color: Color(0xFF7E7C7C),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 270,
              top: 197,
              child: Container(
                width: 126,
                height: 134,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/126x134"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 67,
              top: 303,
              child: Container(
                width: 173,
                height: 28,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 308,
              child: Text(
                'Learn more about us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 500,
              child: Container(
                width: 366,
                height: 110,
                decoration: ShapeDecoration(
                  color: Color(0xFFFFF1FF),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFC03C5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 56,
              top: 543,
              child: Text(
                'symptoms',
                style: TextStyle(
                  color: Color(0xFF7E7C7C),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 273,
              top: 380,
              child: Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/92x92"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 57,
              top: 421,
              child: Text(
                'upload image',
                style: TextStyle(
                  color: Color(0xFF7E7C7C),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 273,
              top: 509,
              child: Container(
                width: 92,
                height: 92,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/92x92"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
