import 'package:flutter/cupertino.dart';
import 'package:spotify_clone_app/model/artist_album_model.dart';
import 'package:spotify_clone_app/model/artist_model.dart';
import 'package:spotify_clone_app/model/category_model.dart';
import 'package:spotify_clone_app/model/category_new_relases.dart';
import 'package:spotify_clone_app/model/search_model.response.dart';

import 'package:spotify_clone_app/model/user_playlist_model.dart';
import 'package:spotify_clone_app/model/user_profile_model.dart';

import '../model/artist_top_tracks.dart';
import '../service/services.dart';

class SpotifyProvider with ChangeNotifier {
  CategoryModelResponse? response = CategoryModelResponse();

  UserProfileResponse? userProfileResponse = UserProfileResponse();

  UserPlaylistResponse? userPlaylistResponse = UserPlaylistResponse();

  CategoryNewReleasesResponse? newReleaseResponse =
      CategoryNewReleasesResponse();

  ArtistTopTracksResponse? artistTopTracksResponse = ArtistTopTracksResponse();

  ArtistModelResponse? artistIdResponse = ArtistModelResponse();

  ArtistAlbumResponse? artistAlbumResponse = ArtistAlbumResponse();

  SearchModelResponse? searchResponse = SearchModelResponse();

  String? artistId;
  String? id;
  String query = "betül";

  bool isLoading = false;
  getCategoryData() async {
    isLoading = true;
    response = await getCategoryService();
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

  getNewReleaseData() async {
    isLoading = true;
    newReleaseResponse = await getCategoryNewRelaseService();
    isLoading = false;
    getArtistTopTracksData(
        userId: newReleaseResponse!.albums!.items![0].artists![0].id);
    notifyListeners();
  }

  setArtistId(String id) {
    artistId = id;
    notifyListeners();
    getArtistTopTracksData(userId: id);
  }

  getArtistTopTracksData({String? userId}) async {
    isLoading = true;
    artistTopTracksResponse = await getArtistTopTrackService(id = userId);
    isLoading = false;
    notifyListeners();
  }

  getArtistIdData() async {
    isLoading = true;
    artistIdResponse = await getArtistIdService(artistId);
    isLoading = false;
    notifyListeners();
  }

  getArtistAlbumData() async {
    isLoading = true;
    artistAlbumResponse = await getArtistAlbumService(artistId);
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
