import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl03_lite/screens/app.dart/ex0/authentication.dart';
import 'package:fl03_lite/screens/app.dart/ex0/ex0.dart';
import 'package:fl03_lite/screens/app.dart/ex0/welcomePage.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(6,139,254,1),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                          Icon(Icons.person, color: Colors.white),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: TextField(
                                cursorColor: Colors.white,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: usernameController,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Username',
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: GestureDetector(
                            child: Text('SIGN UP', style: TextStyle(fontSize: 24, color: Colors.blue),),
                          onTap: () async{
                              if(
                              emailController.text.isNotEmpty &&
                              usernameController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty
                              ) {
                                var result = await Authentication.signUp(email: emailController.text, password: passwordController.text);
                                print('OK');
                                if(result is UserCredential) {
                                  Account newAccount = Account(
                                    id: result.user!.uid,
                                    email: emailController.text,
                                    username: usernameController.text,
                                    password: passwordController.text,
                                  );
                                  var _result = await UserFirestore.setUser(newAccount);
                                  if(_result == true) {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                                  }
                                }
                              }
                          },
                        ),
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
                      GestureDetector(
                          child: Text("Sign up.", style: TextStyle(fontSize: 18, color: Colors.white),),
                        onTap: () {
                            Navigator.pop(context);
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
      ),
    );
  }
}
