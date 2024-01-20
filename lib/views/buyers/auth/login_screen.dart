import 'package:flutter/material.dart';
import 'package:multi_store_app_01/controllers/auth_controller.dart';
import 'package:multi_store_app_01/views/buyers/auth/register_screen.dart';
import 'package:multi_store_app_01/views/buyers/auth/snackbar_widget.dart';

import '../main_screen.dart';
import 'register_screen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email;
  late String password;

  _loginUser() async {
    if(_formKey.currentState!.validate()){
      var res = await _authController.loginUsers(email, password);
      if(res == 'Success'){
        return Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context){
              return MainScreen();
            }));
      }
      else{
        return showSnackBar(context, 'Something went wrong');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              textEmailInputWidget(),
              textPasswordInputWidget(),
              submitLoginButton(context),
              textHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textHaveAccount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't you have an account?"),
          TextButton(
            onPressed: () {

            },
            child: Text('REGISTER',
              style: TextStyle(
                  color: Colors.yellow.shade900
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget textEmailInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
            return 'Please enter an email';
          }else{
            return null;
          }
        },
        onChanged: (value) {
          email = value;
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Enter your email',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget textPasswordInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TextFormField(
        validator: (value) {
          if(value!.isEmpty){
            return 'Please enter a password';
          }else{
            return null;
          }
        },
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Enter your Password',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget textPhoneInputWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Enter your Phone Number',
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget submitLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: (){
          _loginUser();
        },
        child: Container(
          width: MediaQuery.of(context).size.width - 40.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.yellow.shade900,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              'Login',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
