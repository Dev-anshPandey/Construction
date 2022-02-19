import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool? isLoggedIn;
  final String? UserName;
  final Image? UserImage;

  HomeScreen({this.UserName, this.UserImage, this.isLoggedIn});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.30,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(55),
              bottomRight: Radius.circular(55)),
          //   color: Colors.yellow
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  widget.isLoggedIn == true
                      ? CircleAvatar(
                          backgroundColor: Colors.yellow,
                          child: widget.UserImage)
                      :  const Icon(
                        Icons.account_box_outlined,
                        color: Colors.black,
                         size: 40,
                      ),
                 const SizedBox(
                    width: 15,
                  ),
                  const  Text(
                    "Construction",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                    Icons.search,
                    size: 30,
                  ),
                   const SizedBox(
                    width: 10,
                  ),
                    const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                  const  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// return Scaffold(
//       body: Container(
//         child: Container(
//          padding: EdgeInsets.only(top: 0, left: 10),
//           child: Row(
//             children:   [
              
//              const Center(
//                 child: Text(
//                   "Construction",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 25
//                   ),
                  
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   isLoggedIn == true
//                       ? CircleAvatar(child: UserImage)
//                       : CircleAvatar(
//                           child: Image.network(
//                               "https://gumlet.assettype.com/freepressjournal/2021-08/d499fdca-00cb-41b2-8ed8-4c76351732f4/sprushyataara_tamnaya_prateeka.jpg?format=webp&w=400&dpr=2.6"),
//                         ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   isLoggedIn == true
//                       ? Text(UserName!)
//                       : const Text(
//                           "Sign In",
//                         ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         width: double.infinity,
//         height: MediaQuery.of(context).size.height * 0.24,
//         decoration: const BoxDecoration(
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(55),
//               bottomRight: Radius.circular(55)),
//           color: Colors.yellow,
//         ),
//       ),
//     );