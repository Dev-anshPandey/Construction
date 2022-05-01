import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:provider/provider.dart';
import 'package:svj/provider/user_provider.dart';

IconData icon = Icons.bookmark_border;

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}

getImage(BuildContext context, String ImageName) async {
  Image? image;
  await FireStorageService.loadImage(context, ImageName).then((value) {
    image = Image.network(
      value.toString(),
    );
  });
  return image;
}

int activeState = 0;
//Provider.of<LoggedInUser>(context);
//Provider.of<CarouselState>(context,listen: false).LoggedInUserDetail(link: Image.network(user.photoUrl.toString()) );
final itemss = <Widget>[
  Builder(builder: (context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'designPage');
      },
      child: Column(
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
              child: Image(
                  errorBuilder: (a, b, c) {
                    return Builder(builder: (context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.27,
                        width: MediaQuery.of(context).size.width * 0.93,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffdadada)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: Colors.grey[300]),
                      );
                    });
                  },
                  image: const NetworkImage(
                      "https://archello.s3.eu-central-1.amazonaws.com/images/2016/07/14/exteriorcontemporary.1506081591.9647.jpg")),
            ),
          ),
        ],
      ),
    );
  }),
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
          child: Image(
              errorBuilder: (a, b, c) {
                return Builder(builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffdadada)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: Colors.grey[300]),
                  );
                });
              },
              image: const NetworkImage(
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
          child: Image(
              errorBuilder: (a, b, c) {
                return Builder(builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width * 0.93,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffdadada)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: Colors.grey[300]),
                  );
                });
              },
              image: const NetworkImage(
                  "https://www.wowkitchens.in/images/img1.jpg")),
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
  late Object chair;
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
  void initState() {
    // TODO: implement initState
    chair = Object(fileName: "assets/chair.obj");
    chair.rotation.setValues(30, 215, 20);
    chair.updateTransform();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var customerImage = Provider.of<LoggedInUser>(context);

    // var pactiveState = Provider.of<CarouselState>(context);
    // print(customerImage.LoggedInUserDetail);
    // print(customerImage.fina);
    print(customerImage.links);
    return Scaffold(
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
                children: [
                  const SizedBox(
                    width: 10,
                  ),

                  const Text(
                    "Construction",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  //   Icon(
                  //   Icons.search,
                  //   color: Colors.black,
                  //   size: 30,
                  // ),
                  //  SizedBox(
                  //   width: 10,
                  // // ),
                  customerImage.links != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CircleAvatar(
                            maxRadius: 15,
                            child: customerImage.links,
                          ),
                        )
                      : Container(
                          child: const Icon(
                            Icons.account_circle_outlined,
                            size: 35,
                            color: Colors.black,
                          ),
                        ),
                  const SizedBox(
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
                        height: MediaQuery.of(context).size.height * 0.32,
                        onPageChanged: (index, reason) {
                          Provider.of<LoggedInUser>(context, listen: false)
                              .getActiveState(index);
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
                        //                   Builder(builder: (context) {
                        //   return FutureBuilder(
                        //     future:
                        //         getImage(context, "home-exterior-designing-service-500x500.jpg"),
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState == ConnectionState.done) {
                        //         return Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Container(
                        //             height: MediaQuery.of(context).size.height * 0.16,
                        //              width: MediaQuery.of(context).size.width * 0.45,
                        //             child: snapshot.data as Widget),
                        //         );
                        //       }
                        //       if (snapshot.connectionState == ConnectionState.waiting) {
                        //         return Container(
                        //           child: CircularProgressIndicator(),
                        //         );
                        //       }

                        //       return Container();
                        //     },
                        //   );
                        // })
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                                errorBuilder: (a, b, c) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffdadada)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.grey[300]),
                                  );
                                },
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                width: MediaQuery.of(context).size.width * 0.45,
                                image: const NetworkImage(
                                  "https://i.pinimg.com/originals/da/02/78/da0278e761c149630553f4dc4c742b4b.jpg",
                                )),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                  errorBuilder: (a, b, c) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.16,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffdadada)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.grey[300]),
                                    );
                                  },
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                    errorBuilder: (a, b, c) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.16,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0xffdadada)),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            color: Colors.grey[300]),
                                      );
                                    },
                                    fit: BoxFit.cover,
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
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
                                  errorBuilder: (a, b, c) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.16,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffdadada)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.grey[300]),
                                    );
                                  },
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * 0.16,
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  image: const NetworkImage(
                                      "https://i0.wp.com/www.bioenergyconsult.com/wp-content/uploads/2020/07/hall-design-ideas.png?ssl=1")),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
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
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                                errorBuilder: (a, b, c) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffdadada)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.grey[300]),
                                  );
                                },
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                width: MediaQuery.of(context).size.width * 0.45,
                                image: const NetworkImage(
                                  "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/modern-bedroom-2-1575657173.jpg",
                                )),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Column(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                  errorBuilder: (a, b, c) {
                                    return Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.16,
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0xffdadada)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.grey[300]),
                                    );
                                  },
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
                        Container(
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                                errorBuilder: (a, b, c) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffdadada)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.grey[300]),
                                  );
                                },
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                width: MediaQuery.of(context).size.width * 0.45,
                                image: const NetworkImage(
                                    "https://storage.planner5d.com/s/72b36fe50f4b4b8094d3546d3c0b0da6_14.jpg?v=1613933502")),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: const BoxDecoration(),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                                errorBuilder: (a, b, c) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.16,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffdadada)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.grey[300]),
                                  );
                                },
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.16,
                                width: MediaQuery.of(context).size.width * 0.45,
                                image: const NetworkImage(
                                    "https://maxhouzez.com/au/wp-content/uploads/sites/9/2021/09/1632722537_maxresdefault.jpg")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Engineers,Shops and more",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                  )
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8, bottom: 4),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                          radius: 40,
                                          backgroundImage: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuB0dKQNB6ElAEzGtZ_FZmhJmphRR3BaGjmfmdO5IOTNXiEDKoTlCpSEWf1tFTEPF99dA&usqp=CAU"),
                                          backgroundColor: Colors.white),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Exp: 2-3 yr",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text("Projects: 5",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(
                                            "Working Location : Gor..\nDeoria , Mahrajganj",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0, right: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Er. Abc xyz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Card(
                                        child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 4, bottom: 4),
                                          child: Text("4.8",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 4.0,
                                              left: 4,
                                              top: 2,
                                              bottom: 2),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("(4)"),
                                        ),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    const Icon(Icons.message,
                                        color: Colors.blue)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8, bottom: 4),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuB0dKQNB6ElAEzGtZ_FZmhJmphRR3BaGjmfmdO5IOTNXiEDKoTlCpSEWf1tFTEPF99dA&usqp=CAU"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Exp: 2-3 yr",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text("Projects: 5",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(
                                            "Working Location : Gor..\nDeoria , Mahrajganj",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0, right: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Er. Abc xyz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Card(
                                        child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 4, bottom: 4),
                                          child: Text("4.8",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 4.0,
                                              left: 4,
                                              top: 2,
                                              bottom: 2),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("(4)"),
                                        ),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    const Icon(Icons.message,
                                        color: Colors.blue)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8, bottom: 4),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuB0dKQNB6ElAEzGtZ_FZmhJmphRR3BaGjmfmdO5IOTNXiEDKoTlCpSEWf1tFTEPF99dA&usqp=CAU"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Exp: 2-3 yr",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text("Projects: 5",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(
                                            "Working Location : Gor..\nDeoria , Mahrajganj",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0, right: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Er. Abc xyz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Card(
                                        child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 4, bottom: 4),
                                          child: Text("4.8",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 4.0,
                                              left: 4,
                                              top: 2,
                                              bottom: 2),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("(4)"),
                                        ),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    const Icon(Icons.message,
                                        color: Colors.blue)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8, right: 8, bottom: 4),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 41,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuB0dKQNB6ElAEzGtZ_FZmhJmphRR3BaGjmfmdO5IOTNXiEDKoTlCpSEWf1tFTEPF99dA&usqp=CAU"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          "Exp: 2-3 yr",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text("Projects: 5",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        Text(
                                            "Working Location : Gor..\nDeoria , Mahrajganj",
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0, right: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      "Er. Abc xyz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Card(
                                        child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.0, top: 4, bottom: 4),
                                          child: Text("4.8",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right: 4.0,
                                              left: 4,
                                              top: 2,
                                              bottom: 2),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Text("(4)"),
                                        ),
                                      ],
                                    )),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    const Icon(Icons.message,
                                        color: Colors.blue)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //Chair by Poly by Google [CC-BY], via Poly Pizza
              // Container(
              //   height: 400,
              //   width: 400,
              //   child: Cube(
              //     onSceneCreated: (Scene scene) {
              //       scene.world.add(chair);
              //       scene.camera.zoom = 12;
              //     },
              //   ),
              // )
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
  // const DotIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customerImage = Provider.of<LoggedInUser>(context);
    return AnimatedSmoothIndicator(
      count: itemss.length,
      activeIndex: customerImage.activeState,
      effect: const SlideEffect(
          activeDotColor: Colors.black,
          dotColor: Colors.grey,
          dotHeight: 12,
          dotWidth: 12),
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

// Builder(builder: (context) {
//         return FutureBuilder(
//           future:
//               getImage(context, "home-exterior-designing-service-500x500.jpg"),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return Container(
//                 height: 250,
//                 width: 400,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: snapshot.data as Widget),
//                 ),
//               );
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Container(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return Container();
//           },
//         );
//       })
