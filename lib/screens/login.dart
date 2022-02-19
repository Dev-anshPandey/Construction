import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:svj/screens/home_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Stack(clipBehavior: Clip.none, children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                BgContainer(),
                LoginCard(),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class BgContainer extends StatelessWidget {
  const BgContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 11),
      child: const Opacity(
          opacity: 0.15,
          child: Image(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1565008447742-97f6f38c985c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y29uc3RydWN0aW9ufGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
            fit: BoxFit.fill,
          )),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.30,
      decoration: const BoxDecoration(
          color: Color(0xFFF7CB02),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35))),
    );
  }
}

class LoginCard extends StatefulWidget {
  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool isLoggedIn = false;
  int ls = 1;

  late GoogleSignInAccount user;

  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.2,
      // bottom: MediaQuery.of(context).size.height*0.0003 ,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.68,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 3),
            boxShadow: const [
              BoxShadow(
                // color: Colors.black,
                blurRadius: 6,

                color: Colors.black26,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 55, left: 35, right: 0),
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: MediaQuery.of(context).size.height * 0.17,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            ls = 1;
                          });
                        },
                        child: ls == 1
                            ? const Text(
                                "Log In",
                                style: TextStyle(color: Colors.white),
                              )
                            : const Text(
                                "Log In",
                                style: TextStyle(color: Colors.black),
                              ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ls == 1 ? Colors.black : Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 55, left: 0, right: 35),
                      height: MediaQuery.of(context).size.height * 0.055,
                      width: MediaQuery.of(context).size.height * 0.15,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            ls = 0;
                          });
                        },
                        child: ls == 1
                            ? const Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.black),
                              )
                            : const Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ls == 1 ? Colors.white : Colors.black),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white)))),
                      ),
                    ),
                  ],
                ),
                TextFieldToDisplay(ls),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                    child: Text(
                  "OR",
                  style: TextStyle(color: Colors.grey),
                )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      elevation: 2,
                      child: const CircleAvatar(
                        maxRadius: 21,
                        backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRifhBwWgV_xNLjFzJFkzg1XExdYGqAwxHKEw&usqp=CAU",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          googleSignIn.signIn().then((value) {
                            setState(() {
                              if (value != Null) {
                                user = value!;
                                isLoggedIn = true;
                                HomeScreen(
                                  UserName: user.displayName.toString(),
                                  UserImage:
                                      Image.network(user.photoUrl.toString()),
                                  isLoggedIn: true,
                                  
                                );
                                Navigator.pushNamed(context, 'homeScreen');

                                Fire(value);
                              }
                            });
                          }).catchError((e) {
                            print(e);
                          });
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          elevation: 2,
                          child: const CircleAvatar(
                            maxRadius: 21,
                            backgroundImage: NetworkImage(
                              "https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                 
                Container(
                  child: isLoggedIn
                       ?
                      Column(
                          children: [
                            Text(user.displayName.toString()),
                            CircleAvatar(
                                child: Image.network(user.photoUrl.toString()))
                          ],
                        )
                      : Text(""),
                ),
                
                // GestureDetector(
                //   onTap: () async {
                //     await FirebaseAuth.instance.signOut();
                //     googleSignIn.signOut().then((value) {
                //       setState(() {
                //         isLoggedIn = false;
                //       });
                //     });
                //   },
                //   child: Container(child: Text("Log Out")),
                // ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'homeScreen');
              },
              child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: const Text(
                    "Skip For Now",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> Fire(value) async {
  final GoogleSignInAuthentication? googleAuth = await value?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  await FirebaseAuth.instance.signInWithCredential(credential);
}

class TextFieldToDisplay extends StatelessWidget {
  int ls;
  TextFieldToDisplay(this.ls);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 45),
          child: TextField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Icon(Icons.email),
                labelText: 'Enter your Email'),
            onTap: () {},
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 35, right: 35, top: 35),
          child: TextField(
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Icon(Icons.remove_red_eye),
                labelText: 'Password'),
            onTap: () {},
            obscureText: true,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 60, left: 35, right: 35),
          height: MediaQuery.of(context).size.height * 0.055,
          width: MediaQuery.of(context).size.height * 0.57,
          child: ElevatedButton(
            onPressed: () {
              print("hari bol");
            },
            child: ls == 1 ? Text("Log In") : Text("Sign Up"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.black)))),
          ),
        ),
      ],
    );
  }
}
