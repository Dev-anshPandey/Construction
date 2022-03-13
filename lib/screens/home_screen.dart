import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

IconData icon = Icons.bookmark_border;
int activeState = 0;
  final itemss = <Widget>[
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Exterior Design",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Builder(builder: (context) {
              return Image(
                  image: NetworkImage(
                      "https://media.istockphoto.com/photos/modern-architecture-design-93-for-housebungalow-picture-id473745680?k=20&m=473745680&s=612x612&w=0&h=b5BeNVdq0dk_0rA61Tz1uVLYdcqskq2oM7kuSvkfZY4="));
            }),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Hall Design",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923__480.jpg")),
          ),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Kitchen Design",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
                image: NetworkImage(
                    "https://thumbs.dreamstime.com/b/kitchen-1809137.jpg")),
          ),
        ),
      ],
    ),
  ];

class HomeScreen extends StatefulWidget {
  final bool? isLoggedIn;
  final String? UserName;
  final Image? UserImage;

  HomeScreen({this.UserName, this.UserImage, this.isLoggedIn});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = -1;
  int id = 0;
  
  final items = <Widget>[
    const Icon(
      Icons.shopping_cart,
      size: 29,
      color: Colors.black,
    ),
    const Icon(
      Icons.notifications,
      size: 29,
      color: Colors.black,
    ),
    const Icon(
      Icons.home,
      size: 29,
      color: Colors.black,
    ),
    const Icon(
      Icons.search,
      size: 29,
      color: Colors.black,
    ),
    const Icon(
      Icons.shop,
      size: 29,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   title: const Text("Construction"),
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   actions: const <Widget>[
      //     SizedBox(
      //       width: 3,
      //     ),
      //     // widget.isLoggedIn == true
      //     //     ? CircleAvatar(
      //     //         backgroundColor: Colors.yellow, child: widget.UserImage)
      //     //     : const Icon(
      //     //         Icons.account_box,
      //     //         color: Colors.black,
      //     //         size: 30,
      //     //       ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Center(
      //       child: Text(
      //         "Construction",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 25),
      //       ),
      //     ),
      //     Expanded(child: SizedBox()),
      //     Icon(
      //       Icons.search,
      //       color: Colors.black,
      //       size: 30,
      //     ),
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Icon(
      //       Icons.shopping_cart,
      //       color: Colors.black,
      //       size: 30,
      //     ),
      //     SizedBox(
      //       width: 10,
      //     )
      //   ],
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        height: 50,
        index: 2,
        buttonBackgroundColor: Color(0xFFFEE135),
        backgroundColor: Colors.white,
        color: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  // const SizedBox(
                  //   width: 3,
                  // ),
                  // widget.isLoggedIn == true
                  //     ? CircleAvatar(
                  //         backgroundColor: Colors.yellow,
                  //         child: widget.UserImage)
                  //     :  const Icon(
                  //       Icons.account_box_outlined,
                  //       color: Colors.black,
                  //        size: 40,
                  //     ),
                  SizedBox(
                    width: 10,
                  ),

                  Text(
                    "Construction",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  //   Icon(
                  //   Icons.search,
                  //   color: Colors.black,
                  //   size: 30,
                  // ),
                  //  SizedBox(
                  //   width: 10,
                  // // ),
                  // CircleAvatar(
                  //   backgroundImage: NetworkImage(
                  //       "https://lh3.googleusercontent.com/a/AATXAJzdkkerNXT18bl9iMcQubPCAP6BkqHTCX7HeBNB=s28-c-k-no-mo"),
                  // ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          id = 0;
                        });
                      },
                      child: Container(
                        child: id == 0
                            ? DisplayType(
                                type: "All",
                                color: Color(0xFFFEE135),
                                border: Colors.black,
                              )
                            : DisplayType(
                                type: "All",
                                color: Colors.white,
                                border: Colors.white,
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          id = 6;
                        });
                      },
                      child: Container(
                        child: id == 6
                            ? DisplayType(
                                type: "Design",
                                color: Color(0xFFFEE135),
                                border: Colors.black,
                              )
                            : DisplayType(
                                type: "Design",
                                color: Colors.white,
                                border: Colors.white,
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          id = 1;
                        });
                      },
                      child: Container(
                        child: id == 1
                            ? DisplayType(
                                type: "Furniture",
                                color: Color(0xFFFEE135),
                                border: Colors.black,
                              )
                            : DisplayType(
                                type: "Furniture",
                                color: Colors.white,
                                border: Colors.white,
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          id = 2;
                        });
                      },
                      child: Container(
                        child: id == 2
                            ? DisplayType(
                                type: "Marble/Tiles",
                                color: Color(0xFFFEE135),
                                border: Colors.black,
                              )
                            : DisplayType(
                                type: "Marble/Tiles",
                                color: Colors.white,
                                border: Colors.white,
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          id = 3;
                        });
                      },
                      child: Container(
                        child: id == 3
                            ? DisplayType(
                                type: "Engineers",
                                color: Color(0xFFFEE135),
                                border: Colors.black,
                              )
                            : DisplayType(
                                type: "Engineers",
                                color: Colors.white,
                                border: Colors.white,
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          id = 4;
                        });
                      },
                      child: Container(
                        child: id == 4
                            ? DisplayType(
                                type: "Bricks",
                                color: Color(0xFFFEE135),
                                border: Colors.black,
                              )
                            : DisplayType(
                                type: "Bricks",
                                color: Colors.white,
                                border: Colors.white,
                              ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          id = 5;
                        });
                      },
                      child: Container(
                        child: id == 5
                            ? DisplayType(
                                type: "Cement",
                                color: Color(0xFFFEE135),
                                border: Colors.black,
                              )
                            : DisplayType(
                                type: "Cement",
                                color: Colors.white,
                                border: Colors.white,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    itemBuilder: (context, index, realIndex) {
                      return itemss[index];
                    },
                    itemCount: itemss.length,
                    options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        height: MediaQuery.of(context).size.height * 0.374,
                        onPageChanged: (index, reason) {
                          setState(() {
                            activeState = index;
                          });
                        },
                        viewportFraction: 1),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Center(child: DotIndicator()),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(10),
                  //     child: const Image(
                  //         image: NetworkImage(
                  //             "https://media.istockphoto.com/photos/modern-architecture-design-93-for-housebungalow-picture-id473745680?k=20&m=473745680&s=612x612&w=0&h=b5BeNVdq0dk_0rA61Tz1uVLYdcqskq2oM7kuSvkfZY4=")),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Hall Design",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    image: const NetworkImage(
                                        "https://i.pinimg.com/originals/da/02/78/da0278e761c149630553f4dc4c742b4b.jpg")),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  image: const NetworkImage(
                                      "https://cdn.pixabay.com/photo/2016/11/18/17/20/living-room-1835923__480.jpg")),
                            ),
                          ]),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.16,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          image: const NetworkImage(
                                              "https://i.pinimg.com/originals/25/4c/80/254c80ef467dd7fff459c58c5e29a6bf.jpg")),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                decoration: const BoxDecoration(),
                                child: Column(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.16,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        image: const NetworkImage(
                                            "https://i0.wp.com/www.bioenergyconsult.com/wp-content/uploads/2020/07/hall-design-ideas.png?ssl=1")),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height:15
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Bedroom Design",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    image: const NetworkImage(
                                        "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/modern-bedroom-2-1575657173.jpg")),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  image: const NetworkImage(
                                      "https://media.designcafe.com/wp-content/uploads/2020/04/07174357/bedroom-colour-combination-with-burnt-orange-and-purple-1.jpg")),
                            ),
                          ]),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.16,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.45,
                                          image: const NetworkImage(
                                              "https://storage.planner5d.com/s/72b36fe50f4b4b8094d3546d3c0b0da6_14.jpg?v=1613933502")),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 8),
                                decoration: const BoxDecoration(),
                                child: Column(children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image(
                                        fit: BoxFit.cover,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.16,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        image: const NetworkImage(
                                            "https://maxhouzez.com/au/wp-content/uploads/sites/9/2021/09/1632722537_maxresdefault.jpg")),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
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

class DisplayType extends StatelessWidget {
  String? type;
  Color? color;
  Color? border;
  DisplayType({this.type, this.color, this.border});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5, top: 20),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: border!,
              width: 1.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            type!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        )),
        color: color,
      ),
    );
  }
}



class DotIndicator extends StatelessWidget {
  const DotIndicator({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      count: itemss.length,
      activeIndex: activeState,
      effect: const SlideEffect(activeDotColor: Colors.black,
      dotColor: Colors.grey
      ,dotHeight: 12,
      dotWidth: 12
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