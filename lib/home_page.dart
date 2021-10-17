import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:training_app_flutter/video_info.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/info.json")
        .then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Training',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: color.AppColor.homePageTitle),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,
                    size: 20, color: color.AppColor.homePageIcons),
                const SizedBox(
                  width: 10,
                ),
                Icon(Icons.calendar_today_outlined,
                    size: 20, color: color.AppColor.homePageIcons),
                const SizedBox(
                  width: 15,
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 20, color: color.AppColor.homePageIcons),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  'Your program',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: color.AppColor.homePageSubtitle),
                ),
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const VideoInfo());
                  },
                  child: Text(
                    'Details',
                    style: TextStyle(
                        fontSize: 20, color: color.AppColor.homePageDetail),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(Icons.arrow_forward,
                    size: 20, color: color.AppColor.homePageIcons),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  color.AppColor.gradientFirst.withOpacity(0.8),
                  color.AppColor.gradientSecond.withOpacity(0.6)
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5, 10),
                      blurRadius: 20,
                      color: color.AppColor.gradientSecond.withOpacity(0.2)),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Next workout',
                        style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageContainerTextSmall)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('Legs Toning',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: color.AppColor.homePageContainerTextBig)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('and Glutes Workout',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: color.AppColor.homePageContainerTextBig)),
                    Expanded(child: Container()),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: color.AppColor.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('60 min',
                                style: TextStyle(
                                  fontSize: 15,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                )),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: color.AppColor.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4, 8),
                              )
                            ],
                          ),
                          child: const Icon(Icons.play_circle_fill,
                              color: Colors.white, size: 60),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 30),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/card.jpg'),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                          blurRadius: 40,
                          offset: const Offset(8, 10),
                        ),
                        BoxShadow(
                          color: color.AppColor.gradientSecond.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(-1, -5),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(right: 190),
                    decoration: BoxDecoration(
                      // color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/figure.png'),
                        //fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    // color: Colors.redAccent.withOpacity(0.2),
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your are doing great',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageDetail),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Keep it up\n',
                              style: TextStyle(
                                  color: color.AppColor.homePagePlanColor,
                                  fontSize: 16),
                              children: const [
                                TextSpan(text: 'Stick to your plan!')
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Area of focus',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: color.AppColor.homePageTitle),
                )
              ],
            ),
            Expanded(
                child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView.builder(
                  itemCount: info.length.toDouble() ~/ 2,
                  itemBuilder: (_, i) {
                    int even = 2 * i;
                    int odd = 2 * i + 1;
                    return Row(
                      children: [
                        Container(
                          height: 170,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          padding: const EdgeInsets.only(bottom: 10),
                          margin: const EdgeInsets.only(left: 30, bottom: 30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(info[even]['img']),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(5, 5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.2),
                              ),
                              BoxShadow(
                                blurRadius: 13,
                                offset: const Offset(-5, -5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(info[even]['title'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail)),
                            ),
                          ),
                        ),
                        Container(
                          height: 170,
                          width: (MediaQuery.of(context).size.width - 90) / 2,
                          padding: const EdgeInsets.only(bottom: 10),
                          margin: const EdgeInsets.only(
                              left: 30, bottom: 30, top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(info[odd]['img']),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                offset: const Offset(5, 5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.2),
                              ),
                              BoxShadow(
                                blurRadius: 13,
                                offset: const Offset(-5, -5),
                                color: color.AppColor.gradientSecond
                                    .withOpacity(0.2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(info[odd]['title'],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: color.AppColor.homePageDetail)),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
