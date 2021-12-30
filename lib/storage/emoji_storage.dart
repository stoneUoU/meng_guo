import 'dart:convert';
import 'package:menghabit/menghabit.dart';
import 'package:meng_guo/function/home/entity/emoji_list_resp_entity.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/generated/json/emoji_list_resp_entity_helper.dart';
import 'package:meng_guo/generated/json/login_resp_entity_helper.dart';
import 'package:menghabit/tool/utils/sp_utils/sp_utils.dart';

class EmojiStorage {
  static const String _emojiKey = "Emoji";

  static Future<bool> putEmojis(List<EmojiListRespEntity> emojis) {
    // String value = json.encode(emojis);
    return SpUtils.putObjectList(_emojiKey, emojis);
  }

  static List<EmojiListRespEntity>? getEmojis() {
    List<EmojiListRespEntity>? list = SpUtils.getObjList(_emojiKey, (v) {
      return emojiListRespEntityFromJson(
          EmojiListRespEntity(), v as Map<String, dynamic>);
    });
    if (list.orEmptyList().isEmpty) {
      return null;
    }
    return list;
  }

  static Future<bool> removeUser() {
    return SpUtils.remove(_emojiKey);
  }
}
