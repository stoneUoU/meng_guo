/// data : "T"
/// code : 10000
/// msg : "msg"
/// timeStamp : "timeStamp"

class BaseResponseEntity<T> {
  dynamic data;
  late int code;
  late String message;
  // late num timeStamp;

  BaseResponseEntity({
    this.data,
    required this.code,
    required this.message,
    // required this.timeStamp,
  });

  BaseResponseEntity.fromJson(dynamic json) {
    data = json["Data"];
    code = json["Code"];
    message = json["Message"];
    // timeStamp = json["timeStamp"];
  }

  bool isResponse() {
    return code == 10000;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["Data"] = data;
    map["Code"] = code;
    map["Message"] = message;
    // map["timeStamp"] = timeStamp;
    return map;
  }
}
