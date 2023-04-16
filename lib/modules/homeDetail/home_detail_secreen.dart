import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
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
                height:43.h,
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
                  padding:  EdgeInsets.only(top: 11.h),
                  child: Container(
                    height: 22.h,
                    width: 36.w,
                    child: Image.asset("assets/images/valoLogo2.png"),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: 7.h,left: 52.w),
                  child: Container(
                    height: 36.h,
                   
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
              fontSize: 14.sp
            ),
            ),
          ),
          SizedBox(height: 4.h,),
          Container(
            height: 22.h,
            width: 35.w,
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
