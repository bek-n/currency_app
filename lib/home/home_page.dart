
import 'package:currency_app/model/homePage_moddel.dart';
import 'package:currency_app/model/model.dart';
import 'package:currency_app/repository/get_info.dart';
import 'package:currency_app/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../main.dart';
import '../store/local_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<MyCurrens> listOfCupures = [];
  bool isLoading = true;
  bool isChangedTheme = true;
  TextEditingController controller = TextEditingController();

  Future<void> getInformation() async {
    isLoading = true;
    setState(() {});
    dynamic data = await GetInformationRepository.getInformation();

    data.forEach((element) {
      listOfCupures.add(MyCurrens.fromJson(element));
    });
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LiteRollingSwitch(
                value: true,
                textOn: 'Light Mode',
                textOff: 'Dark Mode',
                colorOn: Color(0xffEEB525),
                colorOff: Color(0xff464663),
                iconOn: Icons.light_mode,
                iconOff: Icons.dark_mode,
                textSize: 12,
                onChanged: (s) {
                  isChangedTheme = !isChangedTheme;
                  MyApp.of(context)!.change();
                  LocalStore.setTheme(isChangedTheme);
                  setState(() {});
                },
                onDoubleTap: () {},
                onSwipe: () {},
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [],
          centerTitle: true,
          title: Column(
            children: [
              Text('Exchange rate'),
              5.verticalSpace,
              Text(
                'Uzbekistan',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        body: 
             Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView.builder(
                    itemCount: listOfCupures.length,
                    itemBuilder: ((context, index) => Container(
                          child: Column(
                            children: [
                              // Container(
                              //   margin: EdgeInsets.only(bottom: 15),
                              //   height: 103.h,
                              //   width: 290.w,
                              //   decoration: BoxDecoration(
                              //       border: Border.all(
                              //           color: Colors.grey, width: 3),
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(15)),
                              //       gradient: LinearGradient(colors: [
                              //         Color(0xff1A1B31),
                              //         Color(0xff373752),
                              //         Color(0xff26263D),
                              //         Color(0xff373752),
                              //       ])),
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Text('Today is:',
                              //           style: GoogleFonts.alice(
                              //               fontSize: 22,
                              //               color: Style.whiteColor)),
                              //       10.verticalSpace,
                              //       Text(listOfCupures[index].date ?? '',
                              //           style: TextStyle(
                              //               color: Style.whiteColor,
                              //               fontSize: 20)),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                height: MediaQuery.of(context).size.height / 6,
                                width: 290.w,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4, color: Color(0x7018DAA3))
                                  ],
                                  border: Border.all(color: Color(0x7018DAA3)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Theme.of(context).colorScheme.onPrimary,
                                      Theme.of(context).colorScheme.onSecondary,
                                    ],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 22, left: 20),
                                          child: Text(
                                            listOfCupures[index].title ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 22, left: 10),
                                          child: Text(
                                            listOfCupures[index].date ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, left: 25),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            infos[index].imageFlag,
                                            height: 30,
                                            width: 30,
                                          ),
                                          10.horizontalSpace,
                                          Text(listOfCupures[index].code ?? '',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold)),
                                          75.horizontalSpace,
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text('Buy : ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2),
                                                  Text(
                                                    listOfCupures[index]
                                                            .nbuBuyPrice ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2,
                                                  )
                                                ],
                                              ),
                                              9.verticalSpace,
                                              Row(
                                                children: [
                                                  Text('Sell : ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2),
                                                  Text(
                                                    listOfCupures[index]
                                                            .nbuCellPrice ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))),
              ));
  }
}
