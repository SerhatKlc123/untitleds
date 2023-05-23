import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/home.dart';

class AuthController extends GetxController{
  final String _username = 'Allah';
  final String _password = 'yoktur';
  final obscure = false.obs;
  final _box = GetStorage();

  void login(String username, String password){
    if(_username == username && _password == password){
      Get.snackbar('Login Sucess', 'Helal lan sana');
      _box.write('31', 31);
      Get.toNamed('/home');
    }
    else{
      Get.snackbar('Login Failed', 'Kullanıcı detayları hatalı');
    }


  }

  setVisibly(){
    obscure.value = !obscure.value;
  }

  @override
  void onInit() {
    obscure.value = true;
    super.onInit();
  }



}