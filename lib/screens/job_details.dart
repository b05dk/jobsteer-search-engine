// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:jobsteer/model/job_details_model.dart';
import 'package:jobsteer/screens/screens.dart';
import 'package:http/http.dart' as http;

import 'package:jobsteer/widgets/job_details_tag.dart';
import 'package:url_launcher/url_launcher.dart';

class JobDetails extends StatefulWidget {
  final String companyname,
      title,
      tagid1,
      tagid2,
      description,
      job_id,
      thumbnail;
  const JobDetails(
      {Key? key,
      required this.companyname,
      required this.title,
      required this.tagid1,
      required this.tagid2,
      required this.description,
      required this.job_id,
      required this.thumbnail})
      : super(key: key);

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  var url;
  Future getJobs() async {
    http.Response response = await http.get(Uri.parse(
        "https://serpapi.com/search.json?engine=google_jobs&q=${widget.job_id}&hl=en&api_key=5192aaf9e03bcbc1dd8e06aa712c2812d074dbca15d212be9a75323f9663fa4c"));
    var parseData = json.decode(response.body);
    var jsonArray = parseData['apply_options'];
    this.url = jsonArray['link'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: Buildbackbutton(),
          ),
          backgroundColor: kBackground,
          title: Text(
            widget.companyname,
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                letterSpacing: 0.006,
                fontFamily: 'GilroyBold'),
          ),
        ),
        backgroundColor: kBackground,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                // SizedBox(
                //   height: 39,
                // ),
                //button and Company name
                // DividerLine(),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 55, right: 60, bottom: 5),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(color: kBackground),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 73,
                          width: 73,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.thumbnail),
                                fit: BoxFit.cover,
                              ),
                              color: Color(0xffD9896A),
                              borderRadius: BorderRadius.circular(7)),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          widget.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "GilroyMedium",
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          // decoration: BoxDecoration(color: kBackground),
                          height: 50,
                          width: double.infinity,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: 1,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  DetailsTag(tagid: widget.title),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DetailsTag(tagid: widget.tagid2),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  DetailsTag(tagid: "Remote Job"),
                                  SizedBox(width: 10)
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ), // Tags, Company Photo, Job title
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          // var company = companyList[index];
                          return Container(
                            height: 354,
                            width: 374,
                            child: Neumorphic(
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 1,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 15, left: 15),
                                      child: Text(
                                        widget.description,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "GilroyMedium",
                                            fontSize: 16),
                                      ),
                                    );
                                  }),
                              style: NeumorphicStyle(
                                  shadowDarkColorEmboss: Colors.black,
                                  surfaceIntensity: 10,
                                  depth: -5,
                                  intensity: 0.60,
                                  color: kBackground,
                                  shape: NeumorphicShape.convex),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: InkWell(
                      onTap: () async {
                        final urllink = url.toString();
                        if (await canLaunch(urllink)) {
                          await launch(url);
                        }
// opens link
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
                            border:
                                Border.all(color: Color(0xff26458C), width: 2),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          "Apply for Job",
                          style: TextStyle(
                              letterSpacing: 0.005,
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: "GilroyBold"),
                          // style: kTitleStyle.copyWith(
                          //   color: Colors.white,
                          // ),
                        ),
                      )),
                )

                // Details of jobs
              ],
            ),
          ),
        ),
      ),
    );
  }
}
