import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class ImageGetter {
  Future<List<String>> initImages() async {
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('lib/images/artists'))
        .toList();
    return imagePaths;
  }
}
