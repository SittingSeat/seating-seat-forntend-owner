import 'package:flutter/material.dart';
import 'signup.dart';

import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seating Seat',
      routes: {
        '/detail' : (context) => DetailScreen(),
      },
      home: start_page(),
    );
  }
}

class start_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: (EdgeInsets.only(top: 50)),
            ),
            Center(
              child: Image(
                image: AssetImage('assets/ss2.png'),
                width: 170,
                height: 190,
              ),
            ),
            Form(child: Theme(
              data: ThemeData(
                primaryColor: Colors.teal,
                inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 15.0
                    )
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    ButtonTheme(
                        minWidth: 1000.0 ,
                        height: 100.0,
                        child: ElevatedButton(
                            child: Text(' 회원가입'),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => signup()),
                              );
                            })
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ButtonTheme(
                        minWidth: 1000.0 ,
                        height: 100.0,
                        child: ElevatedButton(
                            child: Text('로그인'),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LogIn()),
                              );
                            })
                    )
                  ],
                ),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}