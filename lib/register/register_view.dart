import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key});

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Back',
          style: TextStyle(
            fontSize: 20,
            color: Colors.purple,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.purple,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.only(left: 17.0, bottom: 10),
                width: 100,
                height: 36,
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF471AA0),
                  ),
                ),
              ),
              SizedBox(height: 40),
              buildPasswordField(Icons.person, 'Username'),
              SizedBox(height: 40),
              buildPasswordField(Icons.mail, 'Email'),
              SizedBox(height: 40),
              buildPasswordField(Icons.lock, 'Password'),
              SizedBox(height: 40),
              buildPasswordField(Icons.lock, 'Confirm Password'),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFBB84E8),
                  textStyle: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minimumSize: Size(400, 50),
                  side: BorderSide(color: Color(0xFFBB84E8)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Sign Up'),
              ),

              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF471AA0),
                    ),
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(IconData prefixIcon, String hintText) {
    return Container(
      width: 360.0,
      height: 50.0,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: prefixIcon == Icons.lock ? _obscurePassword : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Color(0xFF471AA0),
              width: 3.0,
            ),
          ),
          prefixIcon: Icon(prefixIcon),
          hintText: hintText,
          suffixIcon: prefixIcon == Icons.lock
              ? IconButton(
            icon: Icon(_obscurePassword
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RegisterView(),
  ));
}
