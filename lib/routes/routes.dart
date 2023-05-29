import 'package:final_app/screens/form_screen.dart';
import 'package:final_app/screens/home_screen.dart';
import 'package:get/get.dart';

class Routes{
  static List<GetPage> get pages=>[
    GetPage(name: '/form_screen', page: ()=> FormScreen()),
    GetPage(name: '/home_screen', page: ()=> HomeScreen()),
  ];
}
