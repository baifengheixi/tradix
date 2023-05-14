import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tradix/app/app.dart';
import 'package:tradix/app/dependency_injection/dependencies.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(MyApp());
}