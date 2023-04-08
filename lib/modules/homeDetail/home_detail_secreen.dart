import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valorantapi/modules/homeDetail/home_detail_controller.dart';

class HomeDetailScreen extends GetView<HomeDetailController> {
  const HomeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffe3e0db),
                ),
                child: Image.network(
                  args[0],
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: 75),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/images/valoLogo2.png"),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: 50,left: 200),
                  child: Container(
                    height: 250,
                    width:150,
                    child:Hero(tag: args[2], 
                    child:  Image.network(args[1],fit: BoxFit.cover,),
                    )
                  ),
                ),
              )
              
            ],

          ),
        
          Padding(
            padding: const EdgeInsets.only(top:50,left:10,right: 10),
            child: Text(args[3],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffff4654),
              fontSize: 20
            ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            height: 150,
            width: 150,
            child: Hero(
              tag: "${args[2]}2", 
              child: Image.network(args[4])
              ),
          )
        ],
      ),
    );
  }
}
