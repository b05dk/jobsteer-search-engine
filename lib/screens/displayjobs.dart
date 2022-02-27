// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace, must_be_immutable

import 'dart:convert';

import 'package:jobsteer/model/jobsmodel.dart';

import 'package:jobsteer/screens/screens.dart';
import 'package:http/http.dart' as http;

class DisplayJobs extends StatefulWidget {
  final String title;
  const DisplayJobs({Key? key, required this.title}) : super(key: key);

  @override
  State<DisplayJobs> createState() => _DisplayJobsState();
}

class _DisplayJobsState extends State<DisplayJobs> {
  Future<List<JobsModel>> getJobs() async {
    http.Response response = await http.get(Uri.parse(
        "https://serpapi.com/search.json?engine=google_jobs&q=${widget.title}&hl=en&api_key=5192aaf9e03bcbc1dd8e06aa712c2812d074dbca15d212be9a75323f9663fa4c"));
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
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: Buildbackbutton(),
          ),
          backgroundColor: kBackground,
          title: Text(
            widget.title,
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                letterSpacing: 0.006,
                fontFamily: 'GilroyBold'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 27,
                  right: 27,
                  top: 30,
                  bottom: 10,
                ),
                child: Container(
                    width: double.infinity,
                    height: 12,
                    child:
                        Image(image: AssetImage("assets/images/Divider.png"))),
              ),
              FutureBuilder<List<JobsModel>>(
                future: getJobs(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<JobsModel> jobs = snapshot.data!;
                    return ListView.builder(
                        itemCount: jobs.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          JobsModel job = jobs[index];
                          return RecentJobCard(
                            companyname: job.company_name.toString(),
                            imageurl: job.thumbnail.toString(),
                            title: job.title.toString(),
                            daysago: job.extensions![0].toString(),
                            description: job.description.toString(),
                            location: job.location,
                            tagid1: job.title,
                            tagid2: job.extensions![1],
                            tagid3: 'Remote Work',
                            jobid: job.jobid.toString(),
                          );
                        });
                  }
                },
              ),
              // DISPLAY JOBS

              // Recent Job Card,
            ],
          ),
        ));
  }
}
