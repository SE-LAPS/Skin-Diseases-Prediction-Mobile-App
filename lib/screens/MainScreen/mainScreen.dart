// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skinapp/navigationDrawer/navigatorDrawer.dart';
import '../../Components/CustomButton.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routName = '/homepage';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("SKINDOC"),
        ),
        body: Material(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
            child: Column(children: [
              Image.asset(
                "assets/images/m.png",
                height: MediaQuery.of(context).size.height * 0.31,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const CustomButton(
                tex: "Camera",
                col: Color.fromARGB(196, 208, 9, 105),
                option: "Camera",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              const CustomButton(
                tex: "Gallery",
                col: Color.fromARGB(174, 138, 14, 93),
                option: "Gallery",
              ),
            ]),
          ),
        ),
        drawer: const NavigatorDrawer(),
      ),
    );
  }
}

//---------------------------------------------------------------------

