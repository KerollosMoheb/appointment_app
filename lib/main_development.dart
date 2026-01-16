import 'package:flutter/material.dart';
import 'package:flutter_complete_project_omar_ahmed/core/di/dependency_injection.dart';
import 'package:flutter_complete_project_omar_ahmed/core/routing/app_router.dart';
import 'package:flutter_complete_project_omar_ahmed/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(DocDoc(appRouter: AppRouter()));
}
