import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.teal,
      title: Text('Data Çekme'),
      actions: [
        IconButton(onPressed: ()=> _controller.logOut(), icon: Icon(Icons.login_outlined, size: 20.r,color: Colors.white,))
      ],

    ),
    body: Obx(
        ()=> _controller.load.value ? const Center(child: CircularProgressIndicator(),):
            ListView.builder(
              itemCount: _controller.products.value.length,
              itemBuilder: (ctx, i){
                return ListTile(
                  onTap: ()=> null,
                  leading: Image.network(_controller.products[i].thumbnail ?? "",height: 50.h,width: 50.h,fit: BoxFit.cover,),
                  title: Text(_controller.products[i].title ?? "null"),
                  subtitle: Text(_controller.products[i].description ?? "null"),
                  trailing: Text("${_controller.products[i].price}\$"),

                );

              },
            )

    ),
    );
  }
}
