import 'package:currency_app/home/home_page.dart';
import 'package:currency_app/store/local_store.dart';
import 'package:currency_app/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChangeTheme = true;

  @override
  void initState() {
    getTheme();

    super.initState();
  }

  getTheme() async {
    isChangeTheme = await LocalStore.getTheme();

    setState(() {});
  }

  void change() {
    isChangeTheme = !isChangeTheme;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            themeMode: isChangeTheme ? ThemeMode.light : ThemeMode.dark,
            theme: ThemeData(
                scaffoldBackgroundColor: Style.whiteColor,
                appBarTheme: AppBarTheme(
                  titleTextStyle: Style.textStyleNormal(
                      size: 18, textColor: Style.blackColor),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  shadowColor: Color(0xffC48E05),
                  backgroundColor: Color(0xffEFEFEF),
                ),
                 textTheme: TextTheme(
                headline1: Style.textStyleBold(
                    ),
                headline2: Style.textStyleSemiRegular(
                    ),
              ),
                
                ),
                darkTheme: ThemeData(
              textTheme: TextTheme(
                 headline1: Style.textStyleBold(
                  textColor: Style.whiteColor
                    ),
                headline2: Style.textStyleSemiRegular(
                    textColor: Style.whiteColor
                    ),
              ),
              scaffoldBackgroundColor: Style.primaryColor,
              appBarTheme: AppBarTheme(
                backgroundColor: Style.primaryColor,
                titleTextStyle: Style.textStyleNormal(
                  textColor: Style.whiteColor,
                 size: 18,
                ),
              ),
            ),
            home: const HomePage(),
          );
        });
  }
}
