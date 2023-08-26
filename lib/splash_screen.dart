import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_api/const/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_api/const/var.dart';
import 'package:weather_api/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    //class variable for showing date
    var date = DateFormat('yyyyy.MMMM.dd GGG hh:mm aaa').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$date",
          textAlign: TextAlign.left,
          selectionColor: Colors.black26,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.light_mode,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: SingleChildScrollView(
            child: Column(
              //wrap it with single child scroll view
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Charsadda',
                  style: TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "lib/images/a1.png",
                      width: 80,
                      height: 80,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "37$degree",
                          style: const TextStyle(
                            color: Vx.gray800,
                            fontSize: 64,
                            fontFamily: "poppins",
                          )),
                      const TextSpan(
                          text: "Sunny",
                          style: TextStyle(
                            color: Vx.gray700,
                            fontSize: 14,
                            letterSpacing: 3,
                            fontFamily: "poppins_light",
                          )),
                    ]))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.expand_less_rounded),
                      label: "41$degree".text.make(),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.expand_more_rounded),
                      label: "26$degree".text.make(),
                    ),
                  ],
                ),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //have created a list of index 3 to use the image images.dart file
                  children: List.generate(
                    3,
                    (index) {
                      //will add the paths of the images as declared in images.dart od string datatypes
                      var iconsList = [clouds, humidity, windspeed];
                      var values = ["70%", "40%", "3.5km/h"];
                      // have created an array variable of named iconsList and passed the strings variable of images.dart file
                      return Column(
                        children: [
                          Image.asset(
                            iconsList[index],
                            width: 60,
                            height: 60,
                          )
                              .box
                              .gray200
                              .padding(const EdgeInsets.all(8))
                              .roundedSM
                              .make(),
                          10.heightBox,
                          values[index].text.gray400.make(),
                        ],
                      );
                    },
                  ),
                ),
                10.heightBox,
                const Divider(),
                10.heightBox,
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              //TO SHow time in every container and +1 will  increase
                              "${index + 1} AM ".text.gray700.make(),
                              Image.asset(
                                "lib/images/a2.png",
                                width: 90,
                              ),
                              "38$degree  ".text.gray200.make(),
                            ],
                          ),
                        );
                      }),
                ),
                10.heightBox,
                const Divider(),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Next 7 Days".text.semiBold.size(20).make(),
                    TextButton(onPressed: () {}, child: "View All".text.make()),
                  ],
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      var day = DateFormat("EEEE").format(
                          DateTime.now().add(Duration(days: index + 1)));
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 12),
                          child: Row(
                            children: [
                              Expanded(child: day.text.semiBold.make()),
                              Expanded(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "lib/images/a3.png",
                                    width: 40,
                                  ),
                                  label: "26$degree".text.black.make(),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "37$degree/",
                                  style: const TextStyle(
                                    color: Vx.gray800,
                                  ),
                                ),
                                TextSpan(
                                  text: "26$degree/",
                                  style: const TextStyle(
                                    color: Vx.gray600,
                                  ),
                                )
                              ]))
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
