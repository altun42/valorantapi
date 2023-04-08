import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:valorantapi/modules/home/home_screen_controller.dart';
import 'package:valorantapi/modules/homeDetail/home_detail_secreen.dart';
import 'package:valorantapi/routes/app_pages.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
        backgroundColor: Color(0xffff4349),
        body: Obx(() {
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: ListView.builder(
                  itemCount: controller.characters.length,
                  itemBuilder: (context, index) {
                    return index!=9? characterCard(index):SizedBox();
                  },
                ));
        }));
  }

  Padding characterCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:  cardButton(index) ,
    );
  }

  Bounceable cardButton(int index) {
    return Bounceable(
        onTap: () {
          Get.to(HomeDetailScreen(), arguments: [
            controller.characters[index].backgroundImage != null
                ? controller.characters[index].backgroundImage!
                : "https://media.valorant-api.com/agents/e370fa57-4757-3604-3648-499e1f642d3f/background.png",
            controller.characters[index].imageUrl != null
                ? controller.characters[index].imageUrl!
                : "https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/fullportrait.png",
            controller.characters[index].name!,
            controller.characters[index].description!,
            controller.characters[index].displayIconUrl!
          ]);
        },
        child: stackCard(index));
  }

  Stack stackCard(int index) {
    return Stack(
      children: [
        Container(
          height: 130,
          decoration: BoxDecoration(
              color: Color(0xff32333d),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 100,
                    width: 100,
                    child: Hero(
                        tag: "${controller.characters[index].name}2",
                        child: Image.network(
                            controller.characters[index].displayIconUrl!))),
                Text(
                  controller.characters[index].name!,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Container(
                  height: 70,
                  width: 100,
                  child: Image.asset(
                    "assets/images/valoLogo.png",
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Color(0xffff4349),
                  borderRadius: BorderRadius.circular(30)),
              child: Hero(
                tag: controller.characters[index].name!,
                child: Image.network(
                  controller.characters[index].imageUrl != null
                      ? controller.characters[index].imageUrl!
                      : "https://media.valorant-api.com/agents/320b2a48-4d9b-a075-30f1-1f93a9b638fa/fullportrait.png",
                ),
              )),
        )
      ],
    );
  }
}
