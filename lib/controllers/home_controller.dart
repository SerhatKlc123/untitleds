import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled/auth/login.dart';
import 'package:untitled/models/product_model.dart';

class HomeController extends GetxController{
  final _box = GetStorage();
  final _dio = Dio();
  final load = false.obs;
  final products = <ProductModel>[].obs;


  void logOut(){
    _box.write('31', 62);
    Get.offAll(LoginPage());
  }

  Future getProduct() async {
    load.value = true;
    String url = "https://dummyjson.com/products";
    var response = await _dio.get(url);
    if(response.statusCode == 200){
      var data = response.data["products"];
      if(data is List){
        products.value = data.map((e) => ProductModel.fromJson(e)).toList();
      }

    }
    load.value = false;

  }


  @override
  void onInit() {
    load.value = false;
    getProduct();
    super.onInit();
  }



}