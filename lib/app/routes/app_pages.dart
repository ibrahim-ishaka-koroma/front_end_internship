import 'package:get/get.dart';
import 'app_routes.dart';
import '../ui/views/login_view.dart';
import '../ui/views/otp_view.dart';
import '../ui/views/home_view.dart';
import '../ui/views/profile_view.dart';
import '../bindings/auth_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/profile_binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(name: AppRoutes.otp, page: () => OtpView(), binding: AuthBinding()),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
