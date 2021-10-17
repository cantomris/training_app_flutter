import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;

class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);

  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];

  _VideoInfoState();
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/video_info.json")
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback((_) => _initData(context));
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.AppColor.gradientFirst.withOpacity(0.9),
            color.AppColor.gradientSecond
          ], begin: const FractionalOffset(0.0, 0.4), end: Alignment.topRight),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 30, right: 30, bottom: 30),
              width: MediaQuery.of(context).size.width,
              // height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                          // Get.to(() => const HomePage());
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageIconColor),
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.info_outline,
                          size: 20, color: color.AppColor.secondPageIconColor),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text('Legs Toning',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: color.AppColor.secondPageTitleColor)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('and Glutes Workout',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: color.AppColor.secondPageTitleColor)),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                color.AppColor
                                    .secondPageContainerGradient1stColor,
                                color.AppColor
                                    .secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 3, right: 8.0, bottom: 3, left: 8),
                          child: Row(
                            children: [
                              Icon(Icons.timer,
                                  color: color.AppColor.secondPageIconColor,
                                  size: 15),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('68 min',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          color.AppColor.secondPageTitleColor))
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                color.AppColor
                                    .secondPageContainerGradient1stColor,
                                color.AppColor
                                    .secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 3, right: 8.0, bottom: 3, left: 8),
                          child: Row(
                            children: [
                              Icon(Icons.handyman_outlined,
                                  color: color.AppColor.secondPageIconColor,
                                  size: 15),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Resistant Band, Kettle bell',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:
                                          color.AppColor.secondPageTitleColor))
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Circuit 1 : Legs Toning',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.circuitsColor),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.loop, color: color.AppColor.loopColor),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '3 sets',
                          style: TextStyle(
                              fontSize: 15, color: color.AppColor.setsColor),
                        )
                      ],
                    ),
                    Expanded(child: _listView()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _listView() {
    return ListView.builder(
      itemCount: videoInfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
            onTap: () {
              debugPrint(index.toString());
            },
            child: _videoInfoCard(index));
      },
    );
  }

  _videoInfoCard(int index) {
    return Container(
      // height: 135,
      // width: 500,
      // color: Colors.green.withOpacity(0.2),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(children: [
        Row(children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(videoInfo[index]['thumbnail']),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 10),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(videoInfo[index]['title'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  videoInfo[index]['time'],
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                )
              ])
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              '15s rest',
              style:
                  TextStyle(fontSize: 14, color: color.AppColor.homePageDetail),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            children: [
              for (int i = 0; i < 70; i++)
                i.isEven
                    ? Container(
                        width: 3,
                        height: 1,
                        decoration: BoxDecoration(
                            color: const Color(0xFF839fed),
                            borderRadius: BorderRadius.circular(2)),
                      )
                    : Container(width: 3, height: 1, color: Colors.white),
            ],
          ),
          // Container(
          //     child: const Text(
          //         '-------------------------------------------------------',
          //         style: TextStyle(
          //             fontSize: 14,
          //             color: Colors.grey))),
        ])
      ]),
    );
  }
}

//MediaQuery.removePadding(
//               removeTop: true,
//               context: context,
//               child: Container(
//                 padding: const EdgeInsets.all(30),
//                 width: MediaQuery.of(context).size.width,
//                 height: 460,
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(100),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Circuit 1 : Legs Toning',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w700),
//                         ),
//                         Expanded(child: Container()),
//                         const Icon(Icons.repeat_outlined),
//                         Text('3 sets')
//                       ],
//                     ),
//                     ListView.builder(
//                       itemBuilder: (BuildContext context, int index) {
//                         return Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                       image:
//                                           AssetImage('assets/images/ex1.png'))),
//                             ),
//                           ],
//                         );
//                       },
//                     )
