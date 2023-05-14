import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tradix/app/commons/global_variable.dart';

abstract class CP {
  Future<http.Response> getCoins();
}

@injectable
class CoinsProvider implements CP {
  @override
  Future<http.Response> getCoins() async {
    var url = Uri.https(dotenv.get("RAPIDAPI_HOST"), '/coins');

    var response = await http.get(url, headers: headers);

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    return response;
  }
}
