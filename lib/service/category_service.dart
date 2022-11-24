import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:spotify_clone_app/model/category_new_relases.dart';

import '../model/category_model.dart';
import 'logging.dart';

final Dio _dio = Dio(
  BaseOptions(
    baseUrl: "https://api.spotify.com/v1/",
    headers: {
      "Authorization":
          "Bearer BQDVZAOdU3E1cZZik6s86ugJMegenfMD74BviJh_a1_gwXBVnVd3v-L8aTO-ZyNTZ00dl3KN7wqu1mf2HbFtChRjJkC9vMTuRgO2XbhfhEHq8kU7QtCDw6tbCJod_fzxLfsjHjl3x77iNcfyfOI6-mhkXyN96iEHTiH_-Nzmm1_ARe7szIjMr5aqhQHYgcjEa0X2eXL--jrxJCSX_Ae1l-pEZdSd_LkVFxsjSw0aCQRvbD8dRLb6iXAr9xkKPD1-d9l_xO_04VNqblmmJErcEsgj6Q"
    },
  ),
);

Future<CategoryModelResponse?> getCategoryService() async {
  CategoryModelResponse? categoryResponse;
  try {
    final response = await _dio
        .get("browse/categories?country=TR&locale=tr_TR&limit=20&offset=10");
    print("ramo");
    categoryResponse = CategoryModelResponse.fromJson(response.data);

    return categoryResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<CategoryNewRelasesResponse?> getCategoryNewRelaseService() async {
  CategoryNewRelasesResponse? categoryNewRelaseResponse;
  try {
    final response =
        await _dio.get("browse/new-releases?country=TR&limit=10&offset=5");
    categoryNewRelaseResponse =
        CategoryNewRelasesResponse.fromJson(response.data);

    return categoryNewRelaseResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}
