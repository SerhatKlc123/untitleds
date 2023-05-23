import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:untitled/controllers/auth_controller.dart';

import '../home.dart';
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black54,),
      borderRadius: BorderRadius.circular(10.r)
  );
  final _controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(onPressed: null, icon: Icon(Icons.arrow_forward, color: Colors.teal, size: 30.r,))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hey,',style: TextStyle(color: Colors.black, fontSize: 28.sp, ),),
                          Text('Login Here.',style: TextStyle(color: Colors.black, fontSize: 28.sp, ),),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('If you\'r new/',style: TextStyle(color: Colors.black54, fontSize: 15.sp, ),),
                                GestureDetector(
                                    onTap: ()=> print('Clicked'),
                                    child: Text('Create New',style: TextStyle(color: Colors.teal, fontSize: 15.sp, ),)),
                              ],

                            ),
                          )

                        ],

                      ),
                      const Spacer(),
                      Image.asset('images/shield.png', height: 100.h,)

                    ],


                  ),
                  SizedBox(height: 60.h,),
                  TextField(
                    controller: _username,
                    style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.black54),
                      border: _border,
                      enabledBorder: _border,
                      disabledBorder: _border,
                      focusedBorder: _border
                    ),
                  ),
                  SizedBox(height: 25.h,),
                  Obx(
                    ()=> TextField(
                      obscureText: _controller.obscure.value,
                      controller: _password,
                      style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.black54),
                          border: _border,
                          enabledBorder: _border,
                          disabledBorder: _border,
                          focusedBorder: _border,

                          suffixIcon: IconButton(icon: Icon(Icons.lock_outlined, color: Colors.teal,size: 18.r,), onPressed: ()=> _controller.setVisibly(),)
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      TextButton(onPressed: null, child: Text('Forgot password?',style: TextStyle(color: Colors.teal, fontSize: 15.sp, ),))

                    ],
                  ),
                  SizedBox(height: 40.h,),

                  ElevatedButton(onPressed: ()=> _controller.login(_username.text, _password.text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    elevation: 2,
                    fixedSize: Size(MediaQuery.of(context).size.width, 50.h),

                    
                  ), child: Text('Login',style: TextStyle(fontSize: 18.sp),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 80.h,
                            child: Divider(color: Colors.black54,thickness: 2,height: 10,)),
                        Text('  OR  ', style: TextStyle(fontSize: 16.sp, color: Colors.black87,),),
                        SizedBox(
                            width: 80.h,
                            child: Divider(color: Colors.black54,thickness: 2,height: 10,)),

                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          elevation: 2,
                          fixedSize: Size(MediaQuery.of(context).size.width / 2.3, 40.h),


                        ), child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.face, color: Colors.white,size: 22.r,),
                            SizedBox(width: 3.w,),
                            Text('Face ID',style: TextStyle(fontSize: 18.sp),),
                          ],
                        ),
                      ),
                      ElevatedButton(onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          elevation: 2,
                          fixedSize: Size(MediaQuery.of(context).size.width / 2.3, 40.h),


                        ), child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.touch_app, color: Colors.white,size: 22.r,),
                              SizedBox(width: 3.w,),
                              Text('Touch ID',style: TextStyle(fontSize: 18.sp),),
                            ],
                          ),
                      ),
                    ],

                  )



                ],

              ),
            ),
          ),

        ),
      ),
    );
  }
}

