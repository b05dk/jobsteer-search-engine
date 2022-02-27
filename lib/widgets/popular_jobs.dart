// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:jobsteer/screens/job_details.dart';
import 'package:jobsteer/screens/screens.dart';

import 'package:jobsteer/widgets/tags.dart';

import 'divider.dart';

class PopularJobsCard extends StatefulWidget {
  late String title,
      companyname,
      tagid1,
      tagid2,
      tagid3,
      daysago,
      location,
      imageurl,
      job_id,
      description;

  PopularJobsCard(
      {Key? key,
      required this.title,
      required this.companyname,
      required this.daysago,
      required this.location,
      required this.tagid1,
      required this.tagid2,
      required this.tagid3,
      required this.imageurl,
      required this.description,
      required this.job_id})
      : super(key: key);

  @override
  State<PopularJobsCard> createState() => _PopularJobsCardState();
}

class _PopularJobsCardState extends State<PopularJobsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      height: 354,
      width: 374,
      child: Neumorphic(
        style: NeumorphicStyle(
            shadowDarkColorEmboss: Colors.black,
            surfaceIntensity: 10,
            depth: -5,
            intensity: 0.60,
            color: kBackground,
            shape: NeumorphicShape.convex),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 125,
              width: 356,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 12, top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: kBackground,
                            borderRadius: BorderRadius.circular(7),
                            image: DecorationImage(
                              image: NetworkImage(widget.imageurl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Container(
                                width: 250,
                                height: 22,
                                child: Expanded(
                                  child: Text(
                                    widget.title,
                                    maxLines: 2,
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontFamily: "GilroyBold"),
                                  ),
                                ),
                              ),
                              Text(
                                widget.companyname,
                                style: TextStyle(
                                    fontFamily: "GilroyMedium",
                                    fontSize: 12,
                                    letterSpacing: 0.025),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 12, top: 16, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Tags(
                          tag_name: widget.tagid1,
                        ),
                        Tags(
                          tag_name: widget.tagid2,
                        ),
                        Tags(
                          tag_name: widget.tagid3,
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                // alignment: Alignment.centerRight,
                height: 52,
                width: 362,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.daysago,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "GilroyMedium",
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.location,
                      style: TextStyle(
                          color: Color(0xff03DAC5),
                          fontFamily: "GilroyBold",
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            DividerLine(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 12, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: NeumorphicButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobDetails(
                                    companyname: widget.companyname,
                                    description: widget.description,
                                    job_id: widget.job_id,
                                    tagid1: widget.tagid1,
                                    tagid2: widget.tagid2,
                                    thumbnail: widget.imageurl,
                                    title: widget.title,
                                  )),
                        );
                      },
                      child: Text(
                        "Details",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: "GilroyMedium",
                            color: Color(0xffCFD0D0)),
                      ),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        intensity: 0.25,
                        color: kBackground,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(100)),
                      ),
                    ),
                    height: 54,
                    width: 132,
                    decoration: BoxDecoration(
                        color: kBackground,
                        border: Border.all(color: Color(0xff212426), width: 2),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: InkWell(
                      onTap: () {
                        print("pressed");
                      },
                      child: Container(
                          child: Center(
                            child: Text("APPLY  NOW",
                                style: TextStyle(
                                    letterSpacing: 0.005,
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontFamily: "GilroyBold")),
                          ),
                          height: 53,
                          width: 155,
                          decoration: BoxDecoration(
                              // boxShadow: BoxShadow[

                              // ],
                              // color: Color(0xff26458C),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  colors: [
                                    Color(0XFF426BB6),
                                    Color(0xff26458C)
                                  ]),
                              border: Border.all(
                                  color: Color(0xff26458C), width: 2),
                              borderRadius: BorderRadius.circular(100))),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
