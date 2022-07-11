import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:projecta_frontend/src/business_logic/bloc_utils/strings.dart';
import 'package:projecta_frontend/src/business_logic/models/model_feed.dart';

class FeedApiProvider {
  Future<FeedModel> fetchFeed(title, feedBody) async {
    final _url = "https://projecta-bugdroid-v01.herokuapp.com/social/blog/?";
    final body = {
      "title": "hello",
      "body": "abhijeet here",
      "keywords": "abhijeet, here"
    };

    print("inside FEED api");

    // try {
      final response = await http.post(Uri.parse(_url),
          headers: {
            HttpHeaders.authorizationHeader : 'Bearer ${ApiStrings.token}'
          },
          body: body);
      print("FEED body >> $body");
      print("FEED statusCode >> ${response.statusCode}");
      print("FEED response >> ${response.body}");
      if (response.statusCode == 200) {
        return FeedModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load FEED');
      }
    // } catch (e) {
    //   return null;
    // }
  }
}
