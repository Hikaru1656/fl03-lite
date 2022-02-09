import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl03_lite/screens/app.dart/ex0/authentication.dart';
import 'package:fl03_lite/screens/app.dart/ex0/signUp.dart';
import 'package:fl03_lite/screens/app.dart/ex0/welcomePage.dart';
import 'package:flutter/material.dart';

class Ex0 extends StatefulWidget {
  const Ex0({Key? key}) : super(key: key);

  @override
  _Ex0State createState() => _Ex0State();
}

class _Ex0State extends State<Ex0> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromRGBO(6,139,254,1),
          width: double.infinity,
          height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:40, bottom: 30),
                    child: Container(
                        width: 120,
                        height: 120,
                        child: Image.network('https://firebase.google.com/downloads/brand-guidelines/PNG/logo-logomark.png?hl=ja'),
                    ),
                  ),
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.email_outlined, color: Colors.white),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: TextField(
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              controller: emailController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.lock_open_outlined, color: Colors.white),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                            child: TextField(
                              obscureText: true,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              controller: passwordController,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    height: 50,
                    width: 320,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () async{
                        var result = await Authentication.emailSignIn(email: emailController.text, password: passwordController.text);
                        if(result is UserCredential) {
                          var _result = await UserFirestore.getUser(result.user!.uid);
                          if(_result == true) {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                          }
                        }
                      },
                      child: Text('LOG IN', style: TextStyle(fontSize: 24, color: Colors.blue),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ?", style: TextStyle(fontSize: 16, color: Colors.white70),),
                    SizedBox(width: 10,),
                    TextButton(
                        child: Text("Sign up.", style: TextStyle(fontSize: 18, color: Colors.white),),
                      onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
