// lib/features/data/services/check_update_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paksimapp/core/constants/app_constants.dart'; // Import your constants
import 'package:pub_semver/pub_semver.dart';

class UpdateInfo {
  final String latestVersion;
  final String downloadUrl;

  UpdateInfo({required this.latestVersion, required this.downloadUrl});
}

class CheckUpdateService {
  static const String _repoOwner = 'shoaibhassan2';
  static const String _repoName = 'paksimapp';
  
  static final Uri _latestReleaseUrl = Uri.parse(
    'https://api.github.com/repos/$_repoOwner/$_repoName/releases/latest'
  );

  Future<UpdateInfo?> checkForUpdate() async {
    try {
      // 1. Get current app version from your constant
      final currentVersion = Version.parse(AppConstants.appVersion);

      // 2. Fetch latest release info from GitHub API
      final response = await http.get(_latestReleaseUrl);
      if (response.statusCode != 200) {
        print('GitHub API request failed with status: ${response.statusCode}');
        return null;
      }

      final json = jsonDecode(response.body);
      
      // The tag_name from GitHub API includes a 'v', e.g., "v1.0.1"
      final latestVersionStr = (json['tag_name'] as String).replaceAll('v', '');
      final latestVersion = Version.parse(latestVersionStr);

      // 3. Compare versions
      if (latestVersion > currentVersion) {
        return UpdateInfo(
          latestVersion: 'v$latestVersionStr',
          downloadUrl: 'https://github.com/$_repoOwner/$_repoName/releases/latest',
        );
      }
      
      return null; // No new version
    } catch (e) {
      print('Update check failed: $e');
      return null;
    }
  }
}