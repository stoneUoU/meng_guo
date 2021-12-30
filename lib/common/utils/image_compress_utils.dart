import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ImageCompressUtil {
  /// 图片压缩 File -> File
  Future<File?> imageCompressAndGetFile(File file) async {
    /// 2M以内不压缩
    if (file.lengthSync() < 2048 * 1024) {
      return file;
    }
    var quality = 100;
    if (file.lengthSync() > 4 * 1024 * 1024) {
      quality = 50;
    } else if (file.lengthSync() > 2 * 1024 * 1024) {
      quality = 60;
    } else if (file.lengthSync() > 1 * 1024 * 1024) {
      quality = 70;
    } else if (file.lengthSync() > 0.5 * 1024 * 1024) {
      quality = 80;
    } else if (file.lengthSync() > 0.25 * 1024 * 1024) {
      quality = 90;
    }
    var dir = await path_provider.getTemporaryDirectory();
    var targetPath = dir.absolute.path +
        "/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        ".jpg";

    File? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      // minWidth: 1080,
      quality: quality,
      rotate: 0,
    );
    //
    // String s = await _getFileSize(file, 1);
    // String s1 = await _getFileSize(result!, 1);

    print("压缩前：${file.lengthSync() / 1024}");

    print("压缩后：${result!.lengthSync() / 1024}");

    return result;
  }

  Future<String> _getFileSize(File file, int decimals) async {
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  /// 图片压缩 File -> Uint8List
  Future<Uint8List?> imageCompressFile(File file) async {
    Uint8List? result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );
    print(file.lengthSync());
    print(result?.length);
    return result;
  }

  /// 图片压缩 Asset -> Uint8List
  Future<Uint8List?> imageCompressAsset(String assetName) async {
    Uint8List? list = await FlutterImageCompress.compressAssetImage(
      assetName,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 180,
    );

    return list;
  }

  /// 图片压缩 Uint8List -> Uint8List
  Future<Uint8List> testCompressList(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 135,
    );
    print(list.length);
    print(result.length);
    return result;
  }
}
