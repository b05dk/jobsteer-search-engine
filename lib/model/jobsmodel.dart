// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class JobsModel {
  late final String title;
  late final String company_name;
  late final String location;
  late final String? description;
  late final String? thumbnail;
  late final String? jobid;
  late final String? tagid1;
  late final List? extensions;

  JobsModel({
    required this.title,
    required this.company_name,
    this.description,
    required this.location,
    this.thumbnail,
    this.jobid,
    this.tagid1,
    this.extensions,
  });
}
