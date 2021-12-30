import 'package:meng_guo/function/login/api/login_api.dart';
import 'package:meng_guo/function/login/entity/login_req_entity.dart';
import 'package:meng_guo/function/login/entity/login_resp_entity.dart';
import 'package:meng_guo/function/login/entity/register_req_entity.dart';
import 'package:meng_guo/function/login/entity/register_resp_entity.dart';
import 'package:menghabit/tool/widget/base_model.dart';
import 'package:meng_guo/net/net_extension.dart';

class LoginModel extends BaseModel {
  /// 用户名+密码登录
  Future<LoginRespEntity> login(LoginReqEntity reqEntity) {
    return request<LoginRespEntity>(LoginApi.LOGIN_USER_NAME,
            data: reqEntity.toJson(), isPost: true)
        .check();
  }

  /// 用户名+密码注册
  Future<RegisterRespEntity> register(RegisterReqEntity reqEntity) {
    return request<RegisterRespEntity>(LoginApi.REGISTER,
            data: reqEntity.toJson(), isPost: true)
        .check();
  }
}
