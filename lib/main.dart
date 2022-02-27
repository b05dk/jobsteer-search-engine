// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:jobsteer/colors.dart';
import 'package:jobsteer/screens/displayjobs.dart';
import 'package:jobsteer/screens/mainpage.dart';
import 'package:jobsteer/screens/onboarding.dart';

import 'package:jobsteer/widgets/popular_jobs.dart';
import 'package:jobsteer/widgets/recent_jobs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jobsteer',
      home: Onbording(),
    );
  }
}
