import 'package:flutter_dotenv/flutter_dotenv.dart';

var headers = {
  'x-rapidapi-host': dotenv.get('RAPIDAPI_HOST'),
  'x-rapidapi-key': dotenv.get('RAPIDAPI_KEY'),
};

var emptyString = '';

Map<String, List<String>> chatCategories = {
  "category": [
    "1",
    "2",
    "3",
    "4",
    "5",
  ],
  "category2": [
    "1",
    "2",
    "3",
    "4",
    "5",
  ],
  "category3": [
    "1",
    "2",
    "3",
    "4",
    "5",
  ]
};
