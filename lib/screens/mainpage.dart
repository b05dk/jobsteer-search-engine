// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_local_variable, non_constant_identifier_names, unused_import, unnecessary_import, avoid_print
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:jobsteer/model/jobsmodel.dart';

import 'package:jobsteer/screens/screens.dart';
import 'package:jobsteer/widgets/divider.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController searchController = TextEditingController();
  Future<List<JobsModel>> getLiveMatches() async {
    http.Response response = await http.get(Uri.parse(
        "https://serpapi.com/search.json?engine=google_jobs&q=google&hl=en&api_key=5192aaf9e03bcbc1dd8e06aa712c2812d074dbca15d212be9a75323f9663fa4c"));
    var parseData = json.decode(response.body);
    var jsonArray = parseData['jobs_results'];
    List<JobsModel> jobs = [];
    for (var jsonJob in jsonArray) {
      JobsModel job = JobsModel(
          title: jsonJob['title'],
          company_name: jsonJob['company_name'],
          description: jsonJob['description'],
          jobid: jsonJob['job_id'],
          location: jsonJob['location'],
          thumbnail: jsonJob['thumbnail'],
          tagid1: jsonJob['title'],
          extensions: jsonJob['extensions']);
      jobs.add(job);
    }

    return jobs;
  }

  Future<List<JobsModel>> getRecentJobs() async {
    http.Response response = await http.get(Uri.parse(
        "https://serpapi.com/search.json?engine=google_jobs&q=javascript&hl=en&api_key=5192aaf9e03bcbc1dd8e06aa712c2812d074dbca15d212be9a75323f9663fa4c"));
    var parseData = json.decode(response.body);
    var jsonArray = parseData['jobs_results'];
    List<JobsModel> jobs = [];
    for (var jsonJob in jsonArray) {
      JobsModel job = JobsModel(
        title: jsonJob['title'],
        company_name: jsonJob['company_name'],
        description: jsonJob['description'],
        jobid: jsonJob['job_id'],
        location: jsonJob['location'],
        thumbnail: jsonJob['thumbnail'],
        tagid1: jsonJob['title'],
        extensions: jsonJob['extensions'],
      );
      jobs.add(job);
    }

    return jobs;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   height: 30,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        width: 243,
                        height: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Hi Buddy,",
                              style: TextStyle(
                                  letterSpacing: 0.025,
                                  color: Colors.white,
                                  fontFamily: 'GilroyBold',
                                  fontSize: 24),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Find Your Dream Job",
                              style: TextStyle(
                                  letterSpacing: 0.025,
                                  color: Colors.white,
                                  fontFamily: 'GilroyBold',
                                  fontSize: 24),
                            )
                          ],
                        )),
                  ),
                  NeumorphicButton(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    onPressed: () {
                      print("onClick");
                    },
                    style: NeumorphicStyle(
                      intensity: 0.20,
                      color: kBackground,
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.circle(),
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: ImageIcon(
                      AssetImage("assets/images/icons/filter.png"),
                      color: orangeborderline,
                      size: 24,
                    ),
                  ),
                ],
              ),
              // header ends here
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 62,
                  width: double.infinity,
                  // decoration:
                  //     // BoxDecoration(borderRadius: BorderRadius.circular(20))
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Color(0xff72787B),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: orangeborderline, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: orangeborderline, width: 1.5),
                        ),
                        suffixIcon: IconButton(
                            focusColor: orangeborderline,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisplayJobs(
                                          title: searchController.text,
                                        )),
                              );
                            },
                            icon: Image.asset(
                              "assets/images/icons/vectorimage.png",
                              width: 24,
                              height: 24,
                            )),
                        hintText: 'Search here...',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontFamily: 'GilroyMedium',
                            color: Color(0xff72787B)),
                        border: InputBorder.none),
                  ),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              DividerLine(),
              SizedBox(
                height: 20,
              ),

              Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 250, 0),
                  child: Text(
                    "Popular Jobs",
                    style: TextStyle(
                        letterSpacing: 0.005,
                        color: Colors.white,
                        fontFamily: "GilroyBold",
                        fontSize: 16),
                  )),
              SizedBox(
                height: 12,
              ),

              // popular cards
              FutureBuilder<List<JobsModel>>(
                future: getLiveMatches(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<JobsModel> jobs = snapshot.data!;
                    return Container(
                      height: 349,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: jobs.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            JobsModel job = jobs[index];
                            return PopularJobsCard(
                              job_id: job.jobid.toString(),
                              companyname: job.company_name.toString(),
                              imageurl: job.thumbnail.toString(),
                              title: job.title.toString(),
                              daysago: job.extensions![0],
                              location: job.location,
                              tagid1: job.title,
                              tagid2: job.extensions![1],
                              tagid3: 'Remote Job',
                              description: job.description.toString(),
                            );
                          }),
                    );
                  }
                },
              ),

              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 250, 0),
                  child: Text(
                    "Recent Jobs",
                    style: TextStyle(
                        letterSpacing: 0.005,
                        color: Colors.white,
                        fontFamily: "GilroyBold",
                        fontSize: 16),
                  )),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<List<JobsModel>>(
                future: getRecentJobs(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<JobsModel> jobs = snapshot.data!;
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          JobsModel job = jobs[index];
                          return RecentJobCard(
                            companyname: job.company_name.toString(),
                            imageurl: job.thumbnail.toString(),
                            title: job.title.toString(),
                            daysago: job.extensions![0],
                            description: job.description.toString(),
                            location: job.location,
                            tagid1: job.title.toString(),
                            tagid2: job.extensions![1],
                            tagid3: 'Remote Job',
                            jobid: job.jobid.toString(),
                          );
                        });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
