// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobsteer/widgets/on_boarding_content.dart';

import 'screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Text(
                        "Jobsteer",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "GilroyBold",
                            fontSize: 33),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24)),
                        height: 422,
                        width: 388,
                        child: Neumorphic(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22, vertical: 42),
                            child: SvgPicture.asset(contents[i].image,
                                height: 339, width: 322),
                          ),
                          style: NeumorphicStyle(
                              shadowDarkColorEmboss: Colors.black,
                              surfaceIntensity: 10,
                              depth: -5,
                              intensity: 0.60,
                              color: kBackground,
                              shape: NeumorphicShape.convex),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
                      ),
                      // ),
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 21,
                            fontFamily: "GilroyBold",
                            color: Color(0xffCFD0D0)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
              child: InkWell(
                onTap: () async {
                  print(currentIndex);
                  if (currentIndex == contents.length - 1) {
                    // await _storeOnboardInfo();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  }

                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 374,
                  height: 50,
                  decoration: BoxDecoration(
                      // boxShadow: BoxShadow[

                      // ],
                      // color: Color(0xff26458C),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0XFF426BB6), Color(0xff26458C)]),
                      border: Border.all(color: Color(0xff26458C), width: 2),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    currentIndex == contents.length - 1 ? "Continue" : "Next",
                    style: TextStyle(
                        letterSpacing: 0.005,
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "GilroyBold"),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff3D65AF),
      ),
    );
  }
}
