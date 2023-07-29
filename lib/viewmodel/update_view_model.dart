import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:patterns_provider/pages/home_page.dart';
import 'package:patterns_provider/services/http_service.dart';

import '../models/post-model.dart';

class UpdateViewModel extends ChangeNotifier {
  bool isLoading = false;
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController bodyTextEditingController = TextEditingController();

  apiPostUpdate(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    Post post = Post(id: (Random().nextInt((pow(2, 30) - 1).toInt())),
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: (Random().nextInt((pow(2, 30) - 1).toInt())));

    var response = await Network.PUT(Network.API_UPDATE + '1', Network.paramsUpdate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }

    isLoading = false;
    notifyListeners();
    print(response);
  }
}