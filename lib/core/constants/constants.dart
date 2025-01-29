import 'package:flutter_dotenv/flutter_dotenv.dart';

const String newsApiBaseURL = 'https://newsapi.org/v2';
String newsApiKey = dotenv.env['ANON_KEY']!;
const String countryQuery = 'us';
const String categoryQuery = 'general';
