import 'package:flutter/cupertino.dart';
import 'package:spotify_clone_app/model/category_model.dart';
import 'package:spotify_clone_app/model/category_new_relases.dart';

import '../service/category_service.dart';

class SpotifyProvider with ChangeNotifier {
  CategoryModelResponse? response = CategoryModelResponse();
  CategoryNewRelasesResponse? newRelasesResponse = CategoryNewRelasesResponse();
  bool isLoading = true;
  getCategoryData() async {
    isLoading = true;
    response = await getCategoryService();
    isLoading = false;
    notifyListeners();
  }

  getCategoryNewRelase() async {
    isLoading = true;
    newRelasesResponse = await getCategoryNewRelaseService();
    isLoading = false;
    notifyListeners();
  }
}
