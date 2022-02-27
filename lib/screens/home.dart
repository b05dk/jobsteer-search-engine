// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobsteer/model/jobsmodel.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<JobsModel>> getLiveMatches() async {
    http.Response response = await http.get(Uri.parse(
        "https://serpapi.com/search.json?engine=google_jobs&q=flutter+new+york&hl=en&api_key=44b17b65ee540422ab534938e98391794fc242b5fb946d672b7e785b18a99386"));
    var parseData = json.decode(response.body);
    var jsonArray = parseData['jobs_results'];
    List<JobsModel> jobs = [];
    for (var jsonJob in jsonArray) {
      JobsModel job = JobsModel(
        title: jsonJob['title'],
        company_name: jsonJob['company_name'],
        location: '',
      );
      jobs.add(job);
    }

    return jobs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<JobsModel>>(
          future: getLiveMatches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // List<dynamic> matches = snapshot.data;

              // var abc = snapshot.data![0]['title'];
              print(snapshot.data.runtimeType);
              List<JobsModel> jobs = snapshot.data!;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  JobsModel job = jobs[index];
                  return ListTile(
                    title: Text(job.company_name),
                  );
                },
              );
            } else {
              return Text("Failed");
            }
          },
        ),
      ),
    );
  }
}
