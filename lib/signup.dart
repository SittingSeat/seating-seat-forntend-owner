import 'dart:convert';

import 'package:flutter/material.dart';
import 'login.dart';

class signup extends StatefulWidget {

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final formKey = GlobalKey<FormState>();
  SignupFormData formData = SignupFormData();

  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _NicknameController = TextEditingController();

  bool circular = false;

  @override
  Widget build(BuildContext context) {

    void _showDialog(String message) {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.lightBlueAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buttonItem(
                  "google.svg", "Continue with Google", 25, () {}),
              const SizedBox(
                height: 15,
              ),
              buttonItem("kakao.svg", "Continue with kakao", 30, () {}),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Or",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   key: ValueKey(1),
              //   keyboardType: TextInputType.text,
              //   decoration: const InputDecoration(prefixIcon: Icon(Icons.account_circle_outlined), labelText: 'nickname', border: OutlineInputBorder(),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.orange,
              //       ),
              //     ),),
              //   onChanged: (value){
              //     formData.nickname = value;
              //   },
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // TextFormField(
              //   key: ValueKey(2),
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: const InputDecoration(prefixIcon: Icon(Icons.mail_outline), labelText: 'Email(=id)', border: OutlineInputBorder(),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.orange,
              //       ),
              //     ),),
              //   onChanged: (value){
              //     formData.email = value;
              //   },
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // TextFormField(
              //   key: ValueKey(3),
              //   keyboardType: TextInputType.text,
              //   obscureText: true,
              //   decoration: const InputDecoration(prefixIcon: Icon(Icons.lock_open_outlined), labelText: 'password', border: OutlineInputBorder(),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.orange,
              //       ),
              //     ),),
              //   onChanged: (value){
              //     formData.password = value;
              //   },
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // TextButton(
              //   child: const Text('Signup'),
              //   onPressed: () async {
              //     var result = await http.post(
              //         Uri.parse('http://15.165.54.240:8080/v2/api-docs/members/join/'),
              //         body: json.encode(formData.toJson()),
              //         headers: {'content-type': 'application/json'}
              //     );
              //     if (result.statusCode == 201) {_showDialog('Successfully signed up');}
              //     else{_showDialog('Failed to sign up');}
              //   },
              // ),
              ButtonTheme(
                  minWidth: 100.0 ,
                  height: 50.0,
                  child: ElevatedButton(
                      child: Text(
                        '이메일 회원가입하러가기',
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Taste()),
                        );}
                  )
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "If you already have an Account ?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    child: const Text(
                      " Login ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonItem(
      String imagePath, String buttonName, double size, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 500,
        height: 60,
        child: Card(
          elevation: 8,
          color: Colors.white24,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                width: 1,
                color: Colors.grey,
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imagePath,
                height: size,
                width: size,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                buttonName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(
      String name, TextEditingController controller, bool obsecureText) {
    return Container(
      width: 400,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: name,
          labelStyle: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1.5,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class SignupFormData {
  String? email;
  String? nickname;
  String? password;

  SignupFormData({
    this.email,
    this.nickname,
    this.password,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'username': nickname,
    'password': password,
  };
}