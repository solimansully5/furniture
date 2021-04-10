import 'package:flutter/material.dart';
import 'package:furniture_app/manager/authntication_manager.dart';
import 'package:furniture_app/utilities/routing_constants.dart';
class Screen2 extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  createUser(BuildContext context)async{
    await AuthManager.createNewUser(
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
        backgroundColor: Colors.red,
        title: Center(
          child: Text('sign up '),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'EMAIL',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'PASSWORD',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
              labelText: 'RE-ENTER PASSWORD',
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
            obscureText: true,
          ),
          FlatButton(
            child: Text('create user'),
            color: Colors.blue,
            onPressed:()=> createUser(context)
          ),
        ],
      ),
    );
  }
}
