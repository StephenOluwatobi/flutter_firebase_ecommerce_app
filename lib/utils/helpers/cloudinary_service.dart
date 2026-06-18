import 'dart:convert';
import 'package:flutter/services.dart'; // Needed to read rootBundle assets
import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName = "dc0y3pjcf";
  static const String uploadPreset = "u3hj89as";

  /// Takes a local asset path (e.g., 'assets/images/products/nike.png'),
  /// converts it to bytes, uploads it, and returns the live web URL string.
  static Future<String?> uploadAssetImage(String assetPath) async {
    try {
      // 1. Read the asset file as raw bytes
      final ByteData byteData = await rootBundle.load(assetPath);
      final List<int> imageBytes = byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      );

      // 2. Set up the Cloudinary API endpoint
      final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
      );

      // 3. Build the multipart request using the bytes
      final request = http.MultipartRequest("POST", url)
        ..fields['upload_preset'] = uploadPreset
        ..files.add(
          http.MultipartFile.fromBytes(
            'file',
            imageBytes,
            filename: assetPath
                .split('/')
                .last, // Grabs 'nike.png' from the path
          ),
        );

      final response = await request.send();

      // 4. Parse the response
      if (response.statusCode == 200) {
        final responseData = await response.stream.toBytes();
        final responseString = utf8.decode(responseData);
        final jsonMap = jsonDecode(responseString);

        // This is the direct secure web link!
        return jsonMap['secure_url'] as String;
      } else {
        print(
          "Cloudinary Asset Upload Failed: ${response.statusCode}",
        );
        return null;
      }
    } catch (e) {
      print("Error uploading asset to Cloudinary: $e");
      return null;
    }
  }
}
