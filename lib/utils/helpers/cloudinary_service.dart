import 'dart:convert';
import 'dart:io'; // Needed for File
import 'package:flutter/services.dart'; // Needed for rootBundle
import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName = "dc0y3pjcf";
  static const String uploadPreset = "u3hj89as";

  /// 1. UPLOAD FROM APP ASSETS
  /// Use this for images bundled inside your app (e.g., 'assets/images/...')
  static Future<String?> uploadAssetImage(String assetPath) async {
    try {
      final ByteData byteData = await rootBundle.load(assetPath);
      final List<int> imageBytes = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );

      return await _performUpload(imageBytes, assetPath.split('/').last);
    } catch (e) {
      print("Error uploading asset: $e");
      return null;
    }
  }

  /// 2. UPLOAD FROM DEVICE GALLERY/CAMERA
  /// Use this for images picked by the user using ImagePicker
  static Future<String?> uploadFile(String filePath) async {
    try {
      final File file = File(filePath);
      final List<int> imageBytes = await file.readAsBytes();

      return await _performUpload(imageBytes, filePath.split('/').last);
    } catch (e) {
      print("Error uploading file: $e");
      return null;
    }
  }

  /// HELPER METHOD: Handles the actual API communication
  static Future<String?> _performUpload(List<int> bytes, String fileName) async {
    try {
      final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
      );

      final request = http.MultipartRequest("POST", url)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(
          http.MultipartFile.fromBytes(
            'file',
            bytes,
            filename: fileName,
          ),
        );

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = utf8.decode(responseData);
        final jsonMap = jsonDecode(responseString);

        return jsonMap['secure_url'] as String;
      } else {
        print("Cloudinary Upload Failed: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception during Cloudinary upload: $e");
      return null;
    }
  }
}