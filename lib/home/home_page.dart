import 'package:currency_app/model/model.dart';
import 'package:currency_app/repository/get_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MyCurrens> listOfCupures = [];
  bool isLoading = true;

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
        appBar: AppBar(
          title: Text('Exchange rate'),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView.builder(
                    itemCount: listOfCupures.length,
                    itemBuilder: ((context, index) => Container(
                          child: Column(
                            children: [
                              Text(
                                listOfCupures[index].title ?? '',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                height: 57,
                                width: 97,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Color(0x1124243D),
                                  Color(0x871B1C32)
                                ])),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 19, vertical: 12),
                                  child: Container(
                                    height: 33,
                                    width: 58,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 28,
                                              color: Color(0xffEFBE24))
                                        ],
                                        gradient: LinearGradient(colors: [
                                          Color(0x25EFBE24),
                                          Color(0x25EEB525)
                                        ])),
                                    child: Text('0.21%'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))),
              ));
  }
}
