import 'package:flutter/cupertino.dart';
import 'package:spotify_clone_app/model/category_model.dart';

import 'package:spotify_clone_app/model/user_playlist_model.dart';
import 'package:spotify_clone_app/model/user_profile_model.dart';

import '../service/services.dart';

class SpotifyProvider with ChangeNotifier {
  CategoryModelResponse? response = CategoryModelResponse();

  UserProfileResponse? userProfileResponse = UserProfileResponse();

  UserPlaylistResponse? userPlaylistResponse = UserPlaylistResponse();

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
}
