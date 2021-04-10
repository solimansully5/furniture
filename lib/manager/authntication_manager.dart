import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthManager{
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static Future<void> handleSignIn({
  Function() onSuccess,
    Function(String) onFail,
}) async {
    try{
      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      onSuccess();
    }on FirebaseAuthException catch(e){
      onFail(e.message);
    }catch(e){
      onFail(e);
    }
  }
  static createNewUser({
    String email,
    String password,
    Function () onSuccess,
    Function (String) onFail,
  })async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(e);
      onFail(e.message);
    } catch (e) {
      onFail(e);
      print(e.toString());
    }
  }

  static signInUser({
    String email,
    String password,
    Function () onSuccess,
    Function (String) onFail,
  })async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      print(e);
      onFail(e.message);
    } catch (e) {
      print(e.toString());
      onFail(e);
    }
  }
}