import 'dart:async';

import 'package:projecta_frontend/src/business_logic/models/model_feed.dart';
import 'package:projecta_frontend/src/business_logic/resources/api_providers.dart';

class FeedBloc {
  final _feedApiProvider = FeedApiProvider();
  final _feedFetcherStreamController = StreamController<FeedModel>();

  Stream<FeedModel> get feedStream => _feedFetcherStreamController.stream;

  fetchFeed(title, feedBody) async {
    FeedModel feedModel = await _feedApiProvider.fetchFeed(title, feedBody);
    _feedFetcherStreamController.sink.add(feedModel);
  }

  dispose() {
    _feedFetcherStreamController.close();
  }
}


var feedBloc= FeedBloc();
