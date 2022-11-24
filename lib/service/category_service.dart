import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:spotify_clone_app/model/category_new_relases.dart';

import '../model/category_model.dart';
import 'logging.dart';

final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://api.spotify.com/v1/",
    headers: {
      "Authorization":
          "Bearer BQC9txYzv962DtBzAAxFZu9LHBBBXiYywf12Sl42IS64DIzyRIloU8F8KC4SDxNywPCDGbd"
    },
    connectTimeout: 5000,
    receiveTimeout: 3000))
  ..interceptors.add(Logging());

Future<CategoryModelResponse?> getCategoryService() async {
  CategoryModelResponse? categoryResponse;
  try {} catch (e) {
    final response = await _dio
        .get("browse/categories?country=SE&locale=sv_SE&limit=10&offset=5");
    print(response.data);
    categoryResponse = CategoryModelResponse.fromJson(response.data);

    return categoryResponse;
    log(e.toString());
  }
  return null;
}

Future<CategoryNewRelasesResponse?> getCategoryNewRelaseService() async {
  CategoryNewRelasesResponse? categoryNewRelaseResponse;
  try {
    final response =
        await _dio.get("browse/new-releases?country=TR&limit=10&offset=5");
    print(response.data);
    categoryNewRelaseResponse =
        CategoryNewRelasesResponse.fromJson(response.data);

    return categoryNewRelaseResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}
