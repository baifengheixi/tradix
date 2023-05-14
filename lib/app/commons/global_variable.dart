import 'package:flutter_dotenv/flutter_dotenv.dart';

var headers = {
  'x-rapidapi-host': dotenv.get('RAPIDAPI_HOST'),
  'x-rapidapi-key': dotenv.get('RAPIDAPI_KEY'),
};
