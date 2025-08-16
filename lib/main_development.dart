import 'package:doctor/core/di/dependency_injection.dart';
import 'package:doctor/core/routing/app_routes.dart';
import 'package:doctor/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future main() async {
  setupGetIt();

  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  runApp(DocApp(appRouter: AppRouter()));
}
