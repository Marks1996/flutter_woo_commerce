import '../index.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/register',
      data: req,
    );
    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/login',
      data: req,
    );
    return UserTokenModel.fromJson(res.data);
  }

  /// 获取用户信息
  static Future<UserProfileModel> profile() async {
    var res = await WPHttpService.to.get(
      '/users/me',
    );
    return UserProfileModel.fromJson(res.data);
  }

  /// 保存用户 billing address
  static Future<UserProfileModel> saveBillingAddress(Billing? req) async {
    var res = await WPHttpService.to.put(
      '/users/me',
      data: {
        "billing": req,
      },
    );
    return UserProfileModel.fromJson(res.data);
  }

  /// 保存用户 shipping address
  static Future<UserProfileModel> saveShippingAddress(Shipping? req) async {
    var res = await WPHttpService.to.put(
      '/users/me',
      data: {
        "shipping": req,
      },
    );
    return UserProfileModel.fromJson(res.data);
  }

  /// 大陆国家洲省列表
  static Future<List<ContinentsModel>> continents() async {
    var res = await WPHttpService.to.get(
      '/users/continents',
    );

    List<ContinentsModel> continents = [];
    for (var item in res.data) {
      continents.add(ContinentsModel.fromJson(item));
    }
    return continents;
  }
}
