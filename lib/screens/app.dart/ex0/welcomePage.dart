import 'package:fl03_lite/screens/app.dart/ex0/ex0.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), //丸み
                        ),
                        backgroundColor: Colors.white.withOpacity(0.8),
                        insetPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.symmetric(vertical: 15),
                        contentPadding: EdgeInsets.only(top: 0, bottom: 15),
                        title: Center(child: Text('are you sure that you want to exit?', style: TextStyle(fontSize: 12, color: Colors.black54),)),
                        content: Center(
                            child: TextButton(
                                child: Text('Sign out', style: TextStyle(fontSize: 24, color: Colors.red),),
                              onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Ex0()));
                              },
                            ),),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), //丸み
                        ),
                        backgroundColor: Colors.white.withOpacity(1.0),
                        insetPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.symmetric(vertical: 15),
                        title: Center(child: TextButton(
                            child: Text('Cancel', style: TextStyle(fontSize: 24, color: Colors.blue),),
                          onPressed: () {
                              Navigator.pop(context);
                          },
                        ),),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                );
              },
            );
          },
        ),
        title: Text('Firebase Login'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(6, 139, 254, 1),
      ),
      body: Container(
        color: Color.fromRGBO(6,139,254,1),
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Text('Welocome, Batman', style: TextStyle(color: Colors.white, fontSize: 28),),
        ),
      ),
    );
  }
}
