import 'package:dio/dio.dart';

import 'package:spotify_clone_app/model/user_playlist_model.dart';
import 'package:spotify_clone_app/model/user_profile_model.dart';

import '../model/category_model.dart';

final Dio _dio = Dio(
  BaseOptions(
    baseUrl: "https://api.spotify.com/v1/",
    headers: {
      "Authorization":
          "Bearer BQBiRrEGtIMMbuOnGmNbgpu55SSwDt_xmHqDFgGNIt7Kot6ly8kjfxN8wuA2MvZiFa_3-rqAlKHs35pyezxq18NSUc417etYJ3nxFLEuQFRkvvrKFP38dhY2j8zcBKLsVWL9N-cRGyqAiEemi-WleOydgkFceqPMzfkWp_DCjc9tWrv7wi8ygkiMC_4GMQTsUY8Jr4qDvQXRH8b4sbp3GVN2z8cQ5RSkubQH5IQmySzu-4UEYfxvcppjGksVzrwAxBU4B7n0cuSY"
    },
  ),
);

Future<CategoryModelResponse?> getCategoryService() async {
  CategoryModelResponse? categoryResponse;
  try {
    final response = await _dio
        .get("browse/categories?country=TR&locale=tr_TR&offset=5&limit=10");
    print("ramo");
    categoryResponse = CategoryModelResponse.fromJson(response.data);

    return categoryResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<UserProfileResponse?> getProfileService() async {
  UserProfileResponse userResponse;
  try {
    final response = await _dio.get("me");
    print("ramo");
    userResponse = UserProfileResponse.fromJson(response.data);

    return userResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<UserPlaylistResponse?> getUserPlaylistService() async {
  UserPlaylistResponse userPlaylistResponse;
  try {
    final response = await _dio.get("users/smedjan/playlists?offset=5&limit=10");
    userPlaylistResponse = UserPlaylistResponse.fromJson(response.data);

    return userPlaylistResponse;
  } catch (e) {
    print(e);
  }
  return null;
}















// Future<CategoryNewRelasesResponse?> getCategoryNewRelaseService() async {
//   CategoryNewRelasesResponse? categoryNewRelaseResponse;
//   try {
//     final response =
//         await _dio.get("browse/new-releases?country=TR&limit=10&offset=5");
//     categoryNewRelaseResponse =
//         CategoryNewRelasesResponse.fromJson(response.data);

//     return categoryNewRelaseResponse;
//   } catch (e) {
//     log(e.toString());
//   }
//   return null;
// }
