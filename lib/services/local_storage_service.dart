import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String userKey = 'user_profile';
  static const String joinedCommunitiesKey = 'joined_communities';

  Future<void> saveUserProfile(Map<String, dynamic> user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedUser = jsonEncode(user);

    await prefs.setString(userKey, encodedUser);
  }

  Future<Map<String, dynamic>?> getUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(userKey);

    if (data == null) {
      return null;
    }

    final decodedData = jsonDecode(data);

    if (decodedData is Map<String, dynamic>) {
      return decodedData;
    }

    return Map<String, dynamic>.from(decodedData as Map);
  }

  Future<void> saveJoinedCommunities(List<String> communities) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(joinedCommunitiesKey, communities);
  }

  Future<List<String>> getJoinedCommunities() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(joinedCommunitiesKey) ?? [];
  }

  Future<void> clearStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(userKey);
    await prefs.remove(joinedCommunitiesKey);
  }
}