import 'package:currency_app/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(Duration(seconds: 4), () {
      isLoading = false;
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: ((context) => HomePage())),
          (route) => false);
    });
   

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo1.png',
              height: 170,
              width: 170,
            ),
            25.verticalSpace,
            Text(
              'Currency App',
              style: Theme.of(context).textTheme.headline1,
            ),
             45.verticalSpace,
            isLoading
                ? LoadingAnimationWidget.staggeredDotsWave(color: Colors.orangeAccent, size: 40)
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
