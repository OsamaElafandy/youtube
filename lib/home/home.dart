import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:youtube/home/widgets/horizontal_list_widget.dart';
import 'package:youtube/home/widgets/landscape_list_widget.dart';
import 'package:youtube/home/widgets/portrait_list_widget.dart';
import 'package:youtube/models/youtube_model.dart';
import 'package:youtube/video_detail/video_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key key,
      this.isHorizontalList = false,
      this.isMiniList = false,
      this.currentVideo})
      : super(key: key);
  final bool isMiniList;
  final bool isHorizontalList;
  final String currentVideo;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    if (widget.isHorizontalList) {
      return FutureBuilder(
        future: FirebaseFirestore.instance.collection('youtube').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Scaffold(
                body: Center(
                    child: LoadingAnimationWidget.beat(
                  color: const Color.fromARGB(255, 184, 45, 45),
                  size: 35,
                )),
              );
            case ConnectionState.none:
              return const Center(child: Text('No Connection'));

            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                List<YoutubeModel> listData = snapshot.data.docs
                    .map((doc) => YoutubeModel.fromJson(doc.data()))
                    .toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          PageTransition(
                            curve: Curves.linear,
                            type: PageTransitionType.bottomToTop,
                            child: VideoDetail(
                              detail: listData[index],
                            ),
                            isIos: true,
                            duration: const Duration(milliseconds: 400),
                          ),
                        );
                      },
                      child: HorizontalListWidget(
                          index: index, listData: listData),
                    );
                  },
                );
              }
              return const SizedBox();
          }
        },
      );
    } else {
      return FutureBuilder(
          future: FirebaseFirestore.instance.collection('youtube').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                    child: LoadingAnimationWidget.beat(
                  color: const Color.fromARGB(255, 184, 45, 45),
                  size: 35,
                ));
              case ConnectionState.none:
                return const Center(child: Text('No Connection'));

              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  List<YoutubeModel> listData = snapshot.data.docs
                      .map((doc) => YoutubeModel.fromJson(doc.data()))
                      .toList();

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (widget.isMiniList ||
                          deviceOrientation == Orientation.landscape) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                curve: Curves.linear,
                                type: PageTransitionType.bottomToTop,
                                child: VideoDetail(
                                  detail: listData[index],
                                ),
                                isIos: true,
                                duration: const Duration(milliseconds: 400),
                              ),
                            );
                          },
                          child: LandscapeListWidget(
                            index: index,
                            isHorizontalList: widget.isHorizontalList,
                            isMiniList: widget.isMiniList,
                            listData: listData,
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageTransition(
                              curve: Curves.linear,
                              type: PageTransitionType.bottomToTop,
                              child: VideoDetail(
                                detail: listData[index],
                              ),
                              isIos: true,
                              duration: const Duration(milliseconds: 400),
                            ));
                          },
                          child: PortraitListWidget(
                              index: index, listData: listData),
                        );
                      }
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 1.0,
                      color: Colors.grey,
                    ),
                    itemCount: listData.length,
                  );
                }
                return const SizedBox();
            }
          });
    }
  }
}
