import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled/auth/login.dart';
import 'package:untitled/home.dart';

void main() async {
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Title',
          getPages: [
            GetPage(name: '/home', page: () => Home()),
          ],
          home: _box.read('31') == null || _box.read('31') == 62 ? LoginPage() : Home() ,
        );
      },

    );
  }
}
