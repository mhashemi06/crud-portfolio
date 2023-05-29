import 'package:final_app/assets/constant.dart';
import 'package:final_app/bindings/bindings.dart';
import 'package:final_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          inputDecorationTheme: InputDecorationTheme(
              border:  UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  )
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  )
              ),
              errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color:kRedColor,
                    width: 1,
                  )
              )

          ),

      ),

      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialBinding: MyBinding(),
      getPages: Routes.pages,
      initialRoute: '/home_screen',
    );
  }
}
