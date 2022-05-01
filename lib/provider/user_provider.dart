import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoggedInUser extends ChangeNotifier {
  GoogleSignInAccount? user;
  var check =
      "https://www.astroved.com/astropedia/assets/images/goddess/krishna2.jpg";
  bool? isLoggedIn = false;
  var links;
  LoggedInUser({this.user, this.isLoggedIn, this.links});
  GoogleSignIn googleSignIn = GoogleSignIn();
  int activeState=0;
  
  getActiveState(as) {
    activeState = as;
    notifyListeners();
  }
  

  LoggedInUserDetail({link}) {
    //print(link);
    // print(link);
    // print(link.image);
    link;
    notifyListeners();
    links = link;
    print(links);
  }

  
  fina() {
    return links;
  }
}
