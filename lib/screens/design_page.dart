import 'package:flutter/material.dart';
class Designpage extends StatelessWidget {
  const Designpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold (
      body: Column(
        children: const[
          Image(image: NetworkImage("https://archello.s3.eu-central-1.amazonaws.com/images/2016/07/14/exteriorcontemporary.1506081591.9647.jpg"))
        ],
      ),
      
    );
  }
}