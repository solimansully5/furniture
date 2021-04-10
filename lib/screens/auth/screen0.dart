import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/manager/authntication_manager.dart';
import 'package:furniture_app/screens/auth/screen1.dart';
import 'package:furniture_app/utilities/colors.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../utilities/routing_constants.dart';
import 'components/auth_button.dart';

class Screen0 extends StatelessWidget {
//  GoogleSignIn _googleSignIn = GoogleSignIn(
//    scopes: [
//      'email',
//      'https://www.googleapis.com/auth/contacts.readonly',
//    ],
//  );
  googleSignIn(BuildContext context)async{
    AuthManager.handleSignIn(
      onSuccess: ()=> Navigator.pushNamed(context, homeRoute),
      onFail: (error)=> print(error),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: Center(
          child: Text('ROKNA For Furniture'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: Wrap(
            children: <Widget>[
              AuthButton(
                text: 'Sign in with email',
                iconData: Icons.mail_outline,
                onPress: ()=> Navigator.pushNamed(context, screen1Route),
              ),
              AuthButton(
                text: 'Create new user',
                iconData: Icons.create,
                onPress: ()=> Navigator.pushNamed(context, screen2Route),
              ),
              AuthButton(
                text: 'Continue with Google',
                iconData: FontAwesomeIcons.google,
                onPress: ()=> googleSignIn(context),
              )
            ],
          ),
        ),
      )
    );
  }
}

