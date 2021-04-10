import 'package:flutter/material.dart';
import 'package:furniture_app/manager/authntication_manager.dart';
import 'package:furniture_app/screens/auth/components/auth_button.dart';
import 'package:furniture_app/utilities/colors.dart';
import 'package:furniture_app/utilities/routing_constants.dart';

class Screen1 extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn(BuildContext context)async{
    await AuthManager.signInUser(
        email: emailController.text,
        password: passwordController.text,
        onSuccess: ()=> Navigator.pushNamed(context, homeRoute),
        onFail: (error)=> print(error)
    );
    print('done');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: Center(
          child: Text('Sign in'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.blue,
                  labelText: 'Email address...',
                  prefixIcon: Icon(Icons.email, color: AppColors.second,),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.second,
                  ),
                  border: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    borderSide: BorderSide.none,
                    //borderSide: const BorderSide(),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.blue,
                  labelText: 'Password...',
                  prefixIcon: Icon(Icons.lock, color: AppColors.second,),
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.second,
                  ),
                  border: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    borderSide: BorderSide.none,
                    //borderSide: const BorderSide(),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20,),
              Container(
                child: InkWell(
                  child: Text('Forget Password',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                  ),),
                ),
              ),
              SizedBox(height: 10,),
              AuthButton(
                text: 'Sign in',
                centered: true,
                onPress: ()=> signIn(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
