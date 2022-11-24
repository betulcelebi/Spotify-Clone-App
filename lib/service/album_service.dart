import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:spotify_clone_app/model/artist_album_model.dart';
import 'package:spotify_clone_app/model/artist_model.dart';
import 'package:spotify_clone_app/model/artist_top_teacks.dart';
import 'package:spotify_clone_app/service/logging.dart';

import '../model/category_model.dart';

final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://api.spotify.com/v1/",
    headers: {
      "Authorization":
          "Bearer BQC9txYzv962DtBzAAxFZu9LHBBBXiYywf12Sl42IS64DIzyRIloU8F8KC4SDxNywPCDGbd"
    },
    connectTimeout: 5000,
    receiveTimeout: 3000))
  ..interceptors.add(Logging());

Future<ArtistModelResponse?> getArtistIdService() async {
  ArtistModelResponse? artistResponse;
  try {
    final response = await _dio.get("artists/0TnOYISbd1XYRBk9myaseg");
    print(response.data);
    artistResponse = ArtistModelResponse.fromJson(response.data);

    return artistResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<ArtistAlbumResponse?> getArtistAlbumService() async {
  ArtistAlbumResponse? artistAlbumResponse;
  try {
    final response = await _dio.get(
        "artists/0TnOYISbd1XYRBk9myaseg/albums?include_groups=single%2Cappears_on&market=TR&limit=10&offset=5");
    print(response.data);
    artistAlbumResponse = ArtistAlbumResponse.fromJson(response.data);

    return artistAlbumResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<ArtistTopTracks?> getArtistTopTrackService() async {
  ArtistTopTracks? artistTopTracksResponse;
  try {
    final response =
        await _dio.get("artists/0TnOYISbd1XYRBk9myaseg/top-tracks?market=TR");
    print(response.data);
    artistTopTracksResponse = ArtistTopTracks.fromJson(response.data);

    return artistTopTracksResponse;
  } catch (e) {
    log(e.toString());
  }
  return null;
}
