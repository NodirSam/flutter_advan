import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/pages/main_page.dart';
import 'package:flutter_advanced/pages/signin_page.dart';
import 'package:flutter_advanced/service/auth_service.dart';
import 'package:flutter_advanced/service/log_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static const String id = "signup_page";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var isLoading = false;
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cpasswordController = TextEditingController();

  void _callSignInPage() {
    Navigator.pushReplacementNamed(context, SignInPage.id);
  }

  void _doSignUp() {
    String fullName = fullNameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String cpassword = cpasswordController.text.toString().trim();
    if (fullName.isEmpty || email.isEmpty || password.isEmpty) return;
    if (cpassword != password) {
      LogService.i("Password and confirm password does not match");
      return;
    }

    setState(() {
      isLoading = true;
    });

    AuthService.signUpUser(fullName, email, password).then((value) => {
          responseSignUp(value!),
        });
  }

  void responseSignUp(User firebaseUser) {
    setState(() {
      isLoading = false;
    });
    Navigator.pushReplacementNamed(context, MainPage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(193, 53, 132, 1),
                Color.fromRGBO(131, 58, 180, 1),
              ]),
        ),
        child: Stack(
          children: [
            Column  (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                //#fullname
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextField(
                    controller: fullNameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "FullName",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.white54)),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //#email
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.white54)),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //#password
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.white54)),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //#cpassword
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: TextField(
                    controller: cpasswordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: "Confirm Password",
                        border: InputBorder.none,
                        hintStyle:
                            TextStyle(fontSize: 17, color: Colors.white54)),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //#signup
                GestureDetector(
                  onTap: _doSignUp,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: _callSignInPage,
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
