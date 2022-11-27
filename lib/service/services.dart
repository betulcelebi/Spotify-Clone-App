import 'package:dio/dio.dart';

import 'package:spotify_clone_app/model/user_playlist_model.dart';
import 'package:spotify_clone_app/model/user_profile_model.dart';

import '../model/artist_album_model.dart';
import '../model/artist_model.dart';
import '../model/artist_top_tracks.dart';
import '../model/category_model.dart';
import '../model/category_new_relases.dart';

final Dio _dio = Dio(
  BaseOptions(
    baseUrl: "https://api.spotify.com/v1/",
    headers: {
      "Authorization":
          "Bearer BQBCxvCjDjxsqTNSxI5ScaGStSoSHDG4XF4L0B98qbLWpfSNMmY_FSQ3hcu_mL94wyxDizuG_LHp0WItYD_o-mrIwpeTXZBZTnYZXnM_C2teV8PR93BI4Y8tsRfh4oBrCOe3ZyD2w3zNxNG4QZKNWomDhoOZZ9Du5bz4NfP4fN8_LaupIYxQrS-sJ468-cGOAzB1DItcu7REH5AnyvO33SzIsU9ScRZmSRSDm_cFet_1_KfnZDq4-V1C-Clb-JhmXtt3fg9wWM5io6W5b0-YgBuLnw"
    },
  ),
);

Future<CategoryModelResponse?> getCategoryService() async {
  CategoryModelResponse? categoryResponse;
  try {
    final response = await _dio
        .get("browse/categories?country=ES&locale=es_ES&offset=0&limit=20");
    print("betul");

    categoryResponse = CategoryModelResponse.fromJson(response.data);

    return categoryResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<List<Categories>?> getCategoriesIdService(String id) async {
  try {
    final response = await _dio.get(
        "browse/categories/$id/tracks?country=ES&locale=es_ES&offset=0&limit=20");
    List<dynamic> idList = response.data["categories"]["items"];

    List<Categories> categoryList =
        idList.map((user) => Categories.fromJson(user)).toList();
    print(categoryList);
    return categoryList;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<UserProfileResponse?> getProfileService() async {
  UserProfileResponse userResponse;
  try {
    final response = await _dio.get("me");
    print("betul");
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
    final response =
        await _dio.get("users/smedjan/playlists?offset=0&limit=20");
    userPlaylistResponse = UserPlaylistResponse.fromJson(response.data);

    return userPlaylistResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<CategoryNewReleasesResponse?> getCategoryNewRelaseService() async {
  CategoryNewReleasesResponse? categoryNewRelaseResponse;
  try {
    final response =
        await _dio.get("browse/new-releases?country=ES&limit=10&offset=0");
    categoryNewRelaseResponse =
        CategoryNewReleasesResponse.fromJson(response.data);

    return categoryNewRelaseResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<ArtistModelResponse?> getArtistIdService(String? artistId) async {
  ArtistModelResponse? artistResponse;
  try {
    final response =
        await _dio.get("artists/${artistId ?? '0TnOYISbd1XYRBk9myaseg'}");
    print(response.data);
    artistResponse = ArtistModelResponse.fromJson(response.data);

    return artistResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<ArtistAlbumResponse?> getArtistAlbumService(String? artistId) async {
  ArtistAlbumResponse? artistAlbumResponse;
  try {
    final response = await _dio.get(
        "artists/${artistId ?? '0TnOYISbd1XYRBk9myaseg'}/albums?market=ES&limit=10&offset=5");
    print(response.data);
    artistAlbumResponse = ArtistAlbumResponse.fromJson(response.data);

    return artistAlbumResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<ArtistTopTracksResponse?> getArtistTopTrackService(
    String? artistId) async {
  ArtistTopTracksResponse? artistTopTracksResponse;
  try {
    final response = await _dio.get(
        "artists/${artistId ?? '0TnOYISbd1XYRBk9myaseg'}/top-tracks?market=ES");
    print(response.data);
    artistTopTracksResponse = ArtistTopTracksResponse.fromJson(response.data);

    return artistTopTracksResponse;
  } catch (e) {
    print(e);
  }
  return null;
}
