import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meng_guo/common/widget/base_extended_image.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/storage/emoji_storage.dart';
import 'package:menghabit/menghabit.dart';

///emoji/image text
class EmojiText extends SpecialText {
  EmojiText(TextStyle? textStyle, {this.start})
      : super(EmojiText.flag, ':',
            textStyle ?? const TextStyle(color: Colors.red));
  static const String flag = ':';
  final int? start;
  @override
  InlineSpan finishText() {
    final String key = toString();

    ///https://github.com/flutter/flutter/issues/42086
    /// widget span is not working on web
    if (EmojiUtil.instance.emojiMap.containsKey(key) && !kIsWeb) {
      //fontsize id define image height
      //size = 30.0/26.0 * fontSize
      const double size = 20.0;

      ///fontSize 26 and text height =30.0
      //final double fontSize = 26.0;
      return ImageSpan(
          // AssetImage(
          //   EmojiUtil.instance.emojiMap[key]!,
          // ),
          NetworkImage(EmojiUtil.instance.emojiMap[key]!),
          // BaseExtendedImage(
          //   url: 'headUrl',
          //   shape: BoxShape.circle,
          //   defaultSize: 30.px,
          //   width: 30.px,
          //   height: 30.px,
          //   placeHolder: 'assets/images/my/my_header_default.png',
          //   // height: 250.px,
          // ),
          actualText: key,
          imageWidth: size,
          imageHeight: size,
          start: start!,
          fit: BoxFit.fill,
          margin: const EdgeInsets.only(left: 2.0, top: 2.0, right: 2.0));
    }

    return TextSpan(text: toString(), style: textStyle);
  }
}

class EmojiUtil {
  EmojiUtil._() {
    List<EmojiListRespEntity>? emojiList = EmojiStorage.getEmojis();
    for (int i = 0; i < emojiList.orEmptyList().length; i++) {
      _emojiMapList['${emojiList.orEmptyList()[i].code}'] =
          '${emojiList.orEmptyList()[i].url}';
    }
  }

  final Map<String, String> _emojiMapList = <String, String>{};

  Map<String, String> get emojiMap => _emojiMapList;

  // final String _emojiFilePath = 'assets';

  static EmojiUtil? _instance;
  static EmojiUtil get instance => _instance ??= EmojiUtil._();
}
