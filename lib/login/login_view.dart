import 'package:flutter/material.dart';
import '../register/register_view.dart';

void main() {
  runApp(MaterialApp(
    home: LoginView(),
  ));
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureTextValue = true;
  String? emailErrorText;
  String? passwordErrorText;

  @override
  Widget build(BuildContext context) {
    double iconSize = 40.0;
    Color iconColor = Color(0xFF471AA0);
    double iconSpacing = 5.0;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60),
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Icon(
                  Icons.phone_iphone,
                  size: 100.0,
                  color: Color(0xFF471AA0),
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.only(right: 250.0, bottom: 10),
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
              SizedBox(height: 20),
              Container(
                width: 360.0,
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xFF471AA0),
                        width: 3.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.person),
                    errorText: emailErrorText,
                  ),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      emailErrorText = null;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 360.0,
                height: 50.0,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Color(0xFF471AA0),
                        width: 3.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          obscureTextValue = !obscureTextValue;
                        });
                      },
                      child: Icon(
                        obscureTextValue
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                    errorText: passwordErrorText,
                  ),
                  controller: passwordController,
                  obscureText: obscureTextValue,
                  onChanged: (value) {
                    setState(() {
                      passwordErrorText = null;
                    });
                  },
                ),
              ),
              SizedBox(height: 8),
              if (passwordErrorText != null)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.only(left: 220.0),
                child: InkWell(
                  onTap: () {
                    print('Forgot Password clicked');
                  },
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF471AA0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  validateEmail();
                  validatePassword();
                  if (emailErrorText == null && passwordErrorText == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterView()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFBB84E8),
                  textStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.all(10.0),
                  minimumSize: Size(340, 50),
                  side: BorderSide(color: Color(0xFFBB84E8)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Sign In'),
              ),
              SizedBox(height: 50),
              Container(
                  child: Text(
                    'Or sign in With',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF471AA0),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Container(
                width: 200.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.star,
                      size: iconSize,
                      color: iconColor,
                    ),
                    SizedBox(width: iconSpacing),
                    Icon(
                      Icons.favorite,
                      size: iconSize,
                      color: iconColor,
                    ),
                    SizedBox(width: iconSpacing),
                    Icon(
                      Icons.close,
                      size: iconSize,
                      color: iconColor,
                    ),
                    SizedBox(width: iconSpacing),
                    Icon(
                      Icons.thumb_up,
                      size: iconSize,
                      color: iconColor,
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20),

              Container(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF471AA0),
                    ),
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                      ),
                      TextSpan(
                        text: 'Sign Up',
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

  void validateEmail() {
    String email = emailController.text;

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(email)) {
      setState(() {
        emailErrorText = 'Invalid email address';
      });
    }
  }

  void validatePassword() {
    String password = passwordController.text;

    if (password.length < 8) {
      setState(() {
        passwordErrorText = 'Password must be at least 8 characters long.';
      });
    } else {

      print('Login successful!');
    }
  }
}
