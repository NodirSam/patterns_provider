import 'package:flutter/cupertino.dart';
import '../models/post-model.dart';
import '../services/http_service.dart';

class HomeViewModel extends ChangeNotifier  {
  bool isLoading = false;
  List<Post> items = [];

  Future  apiPostList() async {
    isLoading = true;
    notifyListeners();  //qiymatni o'zgartir


    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

    if (response != null) {
      items = Network.parsePostList(response);
    } else {
      items = [];
    }
    isLoading = false;
    notifyListeners();  //setstate bilan birxil vazifa bajaryabdi
  }

  Future apiPostDelete(Post post) async {

    isLoading = true;
    notifyListeners();

    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;
    notifyListeners();
    response != null;
  }
}