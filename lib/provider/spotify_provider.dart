import 'package:flutter/cupertino.dart';
import 'package:spotify_clone_app/model/album_track_model.dart';
import 'package:spotify_clone_app/model/artist_album_model.dart';
import 'package:spotify_clone_app/model/artist_model.dart';
import 'package:spotify_clone_app/model/category_model.dart';
import 'package:spotify_clone_app/model/category_new_relases.dart';
import 'package:spotify_clone_app/model/future_playlist_model.dart';
import 'package:spotify_clone_app/model/playlist_id_model.dart';
import 'package:spotify_clone_app/model/search_model.response.dart';

import 'package:spotify_clone_app/model/user_playlist_model.dart';
import 'package:spotify_clone_app/model/user_profile_model.dart';

import '../service/services.dart';

class SpotifyProvider with ChangeNotifier {
  CategoryModelResponse? response = CategoryModelResponse();

  UserProfileResponse? userProfileResponse = UserProfileResponse();

  UserPlaylistResponse? userPlaylistResponse = UserPlaylistResponse();

  // CategoryNewReleasesResponse? newReleaseResponse =
  //     CategoryNewReleasesResponse();

  ArtistModelResponse? artistIdResponse = ArtistModelResponse();

  ArtistAlbumResponse? artistAlbumResponse = ArtistAlbumResponse();

  SearchModelResponse? searchResponse = SearchModelResponse();
  AlbumTrackResponse? albumTrackResponse = AlbumTrackResponse();

  PlaylistIdResponse? playlistIdResponse = PlaylistIdResponse();
  FuturePlaylistResponse? futurePlaylistResponse = FuturePlaylistResponse();

  String? id;
  String query = "betül";
  bool isLoading = false;
  var item;

  getCategoryData() async {
    isLoading = true;
    response = await getCategoryService();
    isLoading = false;
    notifyListeners();
  }

  // getNewReleaseData() async {
  //   isLoading = true;
  //   newReleaseResponse = await getCategoryNewRelaseService();
  //   isLoading = false;

  //   notifyListeners();
  // }

  getFuturePlaylistData() async {
    isLoading = true;
    futurePlaylistResponse = await getFuturePlaylistService();
    isLoading = false;

    notifyListeners();
  }

  getPlaylistIdData(String? id) async {
    isLoading = true;
    playlistIdResponse = await getPlaylistIdService(id);
    isLoading = false;
    notifyListeners();
  }

  getArtistIdData(String? id) async {
    isLoading = true;
    artistIdResponse = await getArtistIdService(id);
    isLoading = false;
    notifyListeners();
  }

  getArtistAlbumData(String? id) async {
    isLoading = true;
    artistAlbumResponse = await getArtistAlbumService(id);
    isLoading = false;
    notifyListeners();
  }

  getAlbumTrackData(String? id) async {
    isLoading = true;
    albumTrackResponse = await getAlbumTrackService(id);
    isLoading = false;
    notifyListeners();
  }

  getUserProfileData() async {
    isLoading = true;
    userProfileResponse = await getProfileService();
    notifyListeners();
  }

  getUserPlaylistData() async {
    isLoading = true;
    userPlaylistResponse = await getUserPlaylistService();
    isLoading = false;
    notifyListeners();
  }

  getSearchData() async {
    isLoading = true;
    searchResponse = await getSearchService(query: query);

    isLoading = false;
    notifyListeners();
  }

  getQueryData(String query) async {
    this.query = query;
    getSearchData();
    notifyListeners();
  }
}
