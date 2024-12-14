import 'package:get/get.dart';

import '../modules/Home/bindings/Login_binding.dart';
import '../modules/Home/views/Login/Login_view.dart';
import '../modules/Home/views/Register/Register_view.dart';

//home
import '../modules/Home/views/Home/Home_view.dart';
import '../modules/Home/views/Home/Deskription/Deskription_view.dart';
import '../modules/Home/views/Home/Deskription/Chat/chat_view.dart';
import '../modules/Home/views/Home/Deskription/Review/Review_view.dart';

//setings
import '../modules/Home/views/setings/Setings_view.dart';
import '../modules/Home/views/setings/PasswordChange/Password_Change_view.dart';
import '../modules/Home/views/setings/ProfilEdit/ProfileEdit_view.dart';
import '../modules/Home/views/setings/Editkamar/EditKamar_view.dart';
import '../modules/Home/views/setings/Editkamar/EditKamarEdit/EditkamarEdit_view.dart';
import '../modules/Home/views/setings/Editkamar/Tambahkamar_view/TambahKamar_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>  LoginView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () =>  RegisterView(),
    ),
    GetPage(
      name: _Paths.SETINGS,
      page: () =>  SetingsView(),
    ),
    GetPage(
      name: _Paths.PASWORDEDIT,
      page: () =>  ChangePasswordView(),
    ),
    GetPage(
      name: _Paths.PROFILEEDIT,
      page: () =>  ProfileEditView(),
    ),
    GetPage(
      name: _Paths.EDITKAMAR,
      page: () =>  EditKamarView(),
    ),
    GetPage(
      name: _Paths.EDITKAMAREDIT,
      page: () =>  EditKamarEditView(),
    ),

    GetPage(
      name: _Paths.TAMBAHKAMAR,
      page: () =>  TambahKamarView(),
    ),
    GetPage(
      name: _Paths.DESCRIPTION,
      page: () =>  KosDetailPage(),
    ),
    GetPage(
      name: _Paths.REVIEW,
      page: () =>  ReviewPage(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () =>  ChatPage(),
    ),
  ];
}
