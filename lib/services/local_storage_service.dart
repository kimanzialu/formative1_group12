import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String userKey = "user_profile";
  static const String joinedCommunitiesKey = "joined_communities";

  Future<void> saveUserProfile(Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(userKey, jsonEncode(user));
  }

  Future<Map<String, dynamic>?> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(userKey);

    if (data == null) return null;

    return jsonDecode(data);
  }

  Future<void> saveJoinedCommunities(List<String> communities) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setStringList(
      joinedCommunitiesKey,
      communities,
    );
  }

  Future<List<String>> getJoinedCommunities() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList(
          joinedCommunitiesKey,
        ) ??
        [];
  }
}
