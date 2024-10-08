import 'package:flutter_mvc/app/models/ApiResponse.dart';
import 'package:get/get.dart';

import 'AppRegisterService.dart';
import 'MockRegisterService.dart';

abstract class RegisterService {
  /// Configure if Mock is enabled or not
  static const _MOCK_ENABLED = false;

  /// Create and get the instance of [RegisterService]
  static RegisterService get instance {
    if (!Get.isRegistered<RegisterService>()) Get.lazyPut<RegisterService>(() => _MOCK_ENABLED ? MockRegisterService() : AppRegisterService());

    return Get.find<RegisterService>();
  }

  /// Register user
  Future<ApiResponse> submitRegistration({
    required Map<String, dynamic> body,
  });
}
