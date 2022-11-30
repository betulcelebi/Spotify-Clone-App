import 'package:dio/dio.dart';
import 'package:spotify_clone_app/model/future_playlist_model.dart';
import 'package:spotify_clone_app/model/playlist_id_model.dart';
import 'package:spotify_clone_app/model/search_model.response.dart';

import 'package:spotify_clone_app/model/user_playlist_model.dart';
import 'package:spotify_clone_app/model/user_profile_model.dart';

import '../model/artist_album_model.dart';
import '../model/artist_model.dart';
import '../model/album_track_model.dart';
import '../model/category_model.dart';
import '../model/future_playlist_model.dart';

final Dio _dio = Dio(
  BaseOptions(
    baseUrl: "https://api.spotify.com/v1/",
    headers: {
      "Authorization":
          "Bearer BQBxaaxbAnFLU22cRxvWf6QJHgU0aDRc1q6zM_qgRp3qSJqciMAyPI5bx4wjteK8Ksqy4nAuricyWMdycBWe5qf-fDcbv5igO6wnuA_IoURSrcyxWrRHPTELSbOiB2tGLgKSqXp-uw8zTY3Dn_KK-ZxMdTSzlKVqERBitHBDYFRBfp0Z-pc50Kh9zg4rcDBBTGSOQRbhu5vZqpYhx4mvlPGNgiwNLg6L_Nb252UXgrgMCBPUbicfzibrjenqz_X7BW1hibL5bLn4wAvc4-gQ9JSBdw"
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

// Future<CategoryNewReleasesResponse?> getCategoryNewRelaseService() async {
//   CategoryNewReleasesResponse? categoryNewRelaseResponse;
//   try {
//     final response =
//         await _dio.get("browse/new-releases?country=ES&limit=10&offset=0");
//     categoryNewRelaseResponse =
//         CategoryNewReleasesResponse.fromJson(response.data);

//     return categoryNewRelaseResponse;
//   } catch (e) {
//     print(e);
//   }
//   return null;
// }

Future<FuturePlaylistResponse?> getFuturePlaylistService() async {
  FuturePlaylistResponse? futurePlaylistResponse;
  try {
    final response = await _dio.get(
        "browse/featured-playlists?country=ES&locale=es_ES&limit=10&offset=0");
    futurePlaylistResponse = FuturePlaylistResponse.fromJson(response.data);

    return futurePlaylistResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<PlaylistIdResponse?> getPlaylistIdService(String? id) async {
  PlaylistIdResponse? playlistIdResponse;
  try {
    final response = await _dio.get("playlists/$id?market=ES");
    playlistIdResponse = PlaylistIdResponse.fromJson(response.data);

    return playlistIdResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<ArtistModelResponse?> getArtistIdService(String? id) async {
  ArtistModelResponse? artistResponse;
  try {
    final response = await _dio.get("artists/$id ");
    print(response.data);
    artistResponse = ArtistModelResponse.fromJson(response.data);

    return artistResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<ArtistAlbumResponse?> getArtistAlbumService(String? id) async {
  ArtistAlbumResponse? artistAlbumResponse;
  try {
    final response =
        await _dio.get("artists/$id/albums?market=ES&limit=10&offset=0");
    print(response.data);
    artistAlbumResponse = ArtistAlbumResponse.fromJson(response.data);

    return artistAlbumResponse;
  } catch (e) {
    print(e);
  }
  return null;
}

Future<AlbumTrackResponse?> getAlbumTrackService(String? id) async {
  AlbumTrackResponse? allbumTracksResponse;
  try {
    final response =
        await _dio.get("albums/$id/tracks?market=ES&limit=10&offset=0");
    print(response.data);
    allbumTracksResponse = AlbumTrackResponse.fromJson(response.data);

    return allbumTracksResponse;
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

Future<SearchModelResponse?> getSearchService({required String query}) async {
  SearchModelResponse? searchResponse;
  try {
    final response = await _dio.get(
        "v1/search?q=$query&type=track%2Cartist&market=ES&limit=10&offset=0");
    print(response.data);
    searchResponse = SearchModelResponse.fromJson(response.data);

    return searchResponse;
  } catch (e) {
    print(e);
  }
  return null;
}
