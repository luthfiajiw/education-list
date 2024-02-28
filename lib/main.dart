import 'package:education_list/app.dart';
import 'package:education_list/core/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupDependencies();

  runApp(const MyApp());
}
