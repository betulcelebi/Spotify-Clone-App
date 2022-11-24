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
          "Bearer BQAe0blyzwcg6-WLK9jVHXaj_-FnHfIxwM70J3g72lemE-UksqRRBSaDc8FIZbEWC8TSlrTSL7RX7xpIjznM8ywrS3sydC0ziaJA8-_b2CECynRY9XSJiX-nSeSmT-GPoLxSQG5K0TAOoCRwvweTj8LYGi04s27PrkC_ROFJYfz05JPwsolWw-W9BtbL_Xk50q5vhd1kCoIGOkJ8n2YIGqLReAbpZELhMgTUZpktIUzDPSlhb9rv4aESsDDw-jiK2oRgQKRyP_ik0fHJKS9hVPNUug"
    },
  ),
);

Future<CategoryModelResponse?> getCategoryService() async {
  CategoryModelResponse? categoryResponse;
  try {
    final response = await _dio
        .get("browse/categories?country=SE&locale=sv_se&offset=5&limit=10");
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
