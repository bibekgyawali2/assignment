import 'package:flutter/foundation.dart';
import 'package:shop/api_service/api_service.dart';
import 'package:shop/model/model.dart';

class AlbumClass extends ChangeNotifier {
  Album? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await fetchAlbum());
    loading = false;

    notifyListeners();
  }
}
