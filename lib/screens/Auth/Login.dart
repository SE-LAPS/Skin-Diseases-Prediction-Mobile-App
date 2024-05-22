import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skinapp/screens/Auth/SignUpScreen.dart';
import 'package:skinapp/screens/MainScreen/mainScreen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const String routName = '/signin';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 247, 127, 206), Color(0x00DAD4DA)],
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenSize.height * 0.08, left: screenSize.width * 0.30),
              child: Text(
                'SIGN IN',
                style: _textStyle(isTitle: true, fontSize: 32),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenSize.height * 0.30,
                  left: screenSize.width * 0.05,
                  right: screenSize.width * 0.05),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(167, 247, 127, 205),
                  hintText: 'Email or mobile number here',
                  hintStyle: TextStyle(
                    color: Color(0xFF606763),
                    fontSize: 15,
                    fontFamily: 'Iskoola Pota',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: screenSize.height * 0.40,
                  left: screenSize.width * 0.05,
                  right: screenSize.width * 0.05),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(207, 247, 127, 205),
                  hintText: 'Password here',
                  hintStyle: TextStyle(
                    color: Color(0xFF606763),
                    fontSize: 15,
                    fontFamily: 'Iskoola Pota',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Positioned(
              left: screenSize.width * 0.07,
              top: screenSize.height * 0.5,
              child: Container(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      _isChecked = value!;
                    },
                  )),
            ),
            Positioned(
              left: screenSize.width * 0.13,
              top: screenSize.height * 0.5,
              child: Text(
                'Remember me',
                style: _textStyle(),
              ),
            ),
            Positioned(
              right: screenSize.width * 0.07,
              top: screenSize.height * 0.51,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child: Text(
                  'Sign up',
                  style: _textStyle(),
                ),
              ),
            ),
            Positioned(
              left: (screenSize.width - 168) / 2,
              top: screenSize.height * 0.59,
              child: GestureDetector(
                onTap: () {
                  // Implement login functionality
                },
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Faild login',
                          desc: 'Please fill all the fields',
                          btnOkOnPress: () {},
                        ).show();
                      } else {
                        signIn(emailController.text, passwordController.text,
                            context);
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 168,
                          height: 57,
                          decoration: ShapeDecoration(
                            color: Color(0xFFD9A7C8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: _textStyle(isTitle: true, fontSize: 20),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: ElevatedButton.icon(
                            icon: Image.asset('assets/images/google.jpg',
                                height: 18.0),
                            label: Text("Login with Google"),
                            onPressed: () async {
                              //    final user = await signInWithGoogle();
                              //  if (user != null) {
                              //    print("Sign in successful! User's email: ${user.email}");
                              // Proceed to next screen or show success message
                              //  }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white, // Text color
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _buildPositionedLabel(BuildContext context,
      {required String label,
      required double topOffset,
      bool isTitle = false}) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.11,
      top: topOffset,
      child: Text(
        label,
        style: _textStyle(isTitle: isTitle),
      ),
    );
  }

  TextStyle _textStyle({bool isTitle = false, double fontSize = 15}) {
    return TextStyle(
      color: isTitle ? Colors.black : Color(0xFF606763),
      fontSize: isTitle ? 32 : fontSize,
      fontFamily: isTitle ? 'Inter' : 'Iskoola Pota',
      fontWeight: FontWeight.w700,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void route(context) {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: ' login successfull',
          desc: ' Go to your home page',
          btnOkOnPress: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
            );
          },
        ).show();
        print("login parent");
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: 'Faild login',
          desc: 'No user found for that email',
          btnOkOnPress: () {},
        ).show();
        print('Document does not exist on the database');
      }
    });
  }

  void signIn(String email, String password, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      route(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: 'Faild login',
          desc: ' No user found for that email',
          btnOkOnPress: () {},
        ).show();
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          animType: AnimType.rightSlide,
          title: 'Faild login',
          desc: ' Wrong password',
          btnOkOnPress: () {},
        ).show();
        print('Wrong password provided for that user.');
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Error',
          desc: e.message,
          btnOkOnPress: () {},
        ).show();
      }
    }
  }
}
