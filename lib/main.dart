import 'package:currency_app/home/home_page.dart';
import 'package:currency_app/home/splash_screen.dart';
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

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
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
              indicatorColor: Color(0xff2E2E47),
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: Color(0xffFCCD3C),
                onPrimary: Colors.orangeAccent,
                secondary: Colors.white,
                onSecondary: Color(0xffFCCD3C),
                primaryContainer: Colors.orange,
                error: Colors.black,
                onError: Colors.white,
                background: Color(0xffFCCD3C),
                onBackground: Colors.white,
                surface: Colors.pink,
                onSurface: Colors.white,
              ),
              scaffoldBackgroundColor: Style.whiteColor,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Color(0xffEEB525), size: 30),
                titleTextStyle: Style.textStyleNormal(
                    size: 18, textColor: Style.blackColor),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                shadowColor: Color(0xffC48E05),
                backgroundColor: Color(0xffEFEFEF),
              ),
              textTheme: TextTheme(
                headline1: Style.textStyleBold(size: 18),
                headline2: Style.textStyleSemiRegular(),
              ),
            ),
            darkTheme: ThemeData(
              indicatorColor: Color(0xffEFBE24),
              iconTheme: IconThemeData(color: Color(0xffEEB525), size: 30),
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                primary: Color(0xff1A1B31),
                onPrimary: Color(0xff1A1B31),
                secondary: Color(0xff373752),
                onSecondary: Color(0xff373752),
                error: Colors.black,
                onError: Colors.white,
                background: Color(0xff1A1B31),
                onBackground: Colors.white,
                surface: Colors.pink,
                onSurface: Colors.white,
              ),
              textTheme: TextTheme(
                headline1:
                    Style.textStyleBold(textColor: Style.whiteColor, size: 18),
                headline2: Style.textStyleSemiRegular(
                  textColor: Style.whiteColor,
                ),
              ),
              scaffoldBackgroundColor: Style.primaryColor,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: Color(0xffEEB525),
                  size: 30,
                ),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                shadowColor: Color(0xffC48E05),
                backgroundColor: Style.primaryColor,
                titleTextStyle: Style.textStyleNormal(
                  textColor: Style.whiteColor,
                  size: 18,
                ),
              ),
            ),
            home: const SplashScreen(),
          );
        });
  }
}
