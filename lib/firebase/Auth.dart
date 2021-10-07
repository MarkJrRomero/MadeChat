import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


abstract class AuthBase{
  User? get Userdata;
  Stream<User?> AuthStatschange();
  Future<User?> Google_Sign_IN();
  Future<void> LogOut();

}

class Auth implements AuthBase{

  @override
  Future<User?> Google_Sign_IN() async{
    final googleauth = GoogleSignIn();
    final login = await googleauth.signIn();

    if(login!=null){

      final authgoogle=await login.authentication;
      if(authgoogle!=null){

        final userdata= await FirebaseAuth.instance.signInWithCredential(GoogleAuthProvider.credential(
          idToken: authgoogle.idToken,
          accessToken: authgoogle.accessToken,
          )
        );
        return userdata.user;
      } else{
        throw FirebaseAuthException(code: "Token Error", message: "Token Error Show");
      }
    } else{
      throw FirebaseAuthException(code: "User Error", message: "User Not Login");
    }
  }



  @override
  Future<void> LogOut() async{

    await FirebaseAuth.instance.signOut();

  }

  @override
  Stream<User?> AuthStatschange() => FirebaseAuth.instance.authStateChanges();

  @override
  // TODO: implement Userdata
  User? get Userdata => FirebaseAuth.instance.currentUser;



}