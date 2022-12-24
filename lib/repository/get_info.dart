import 'dart:convert';
import 'package:http/http.dart' as http;

class GetInformationRepository {
  GetInformationRepository._();
  static getInformation() async {
    try {
      final url = Uri.parse("https://nbu.uz/en/exchange-rates/json/");
      final res = await http.get(url);
      var data;
      if (res.statusCode == 200) {
        data = jsonDecode(res.body);
      }

      return data;
    } catch (e) {
      print(e);
    }
  }
}
