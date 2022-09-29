import 'package:fashion_app/core/dependency_injection/di.dart';
import 'package:fashion_app/data/datasourse/local/cache_helper.dart';
import 'package:fashion_app/data/models/department_icon_model.dart';



String? myToken ='' ;
List <DepartmentsModel>departmentsList=[
  DepartmentsModel(image: 'assets/GUI/dresses/black1.jpg',departmentName: 'Dress'),
  DepartmentsModel(image: 'assets/GUI/tshirt/t-shirt.jpg',departmentName: 'T-Shirts '),
  DepartmentsModel(image: 'assets/GUI/shirt/shirt1.jpg',departmentName: 'Shirts'),
  DepartmentsModel(image: 'assets/GUI/sneakers/sneakers.jpg',departmentName: 'Sneakers'),
  DepartmentsModel(image: 'assets/GUI/watchs/watch.jpg',departmentName: 'Smart Watches'),
  DepartmentsModel(image: 'assets/GUI/laptop/laptop.jpg',departmentName: 'Laptop'),
  DepartmentsModel(image: 'assets/GUI/mobile/mobile1.jpg',departmentName: 'Mobile'),
  DepartmentsModel(image: 'assets/GUI/headset/headset5.jpg',departmentName: 'Head Sets'),
  DepartmentsModel(image: 'assets/GUI/usb/usb1.jpg',departmentName: 'USB'),
  DepartmentsModel(image: 'assets/GUI/mouse/mouse.jpg',departmentName: 'mouses'),
  DepartmentsModel(image: 'assets/GUI/printers/printer.jpg',departmentName: 'printers'),
];
Future<dynamic> getUserToken() async {

  return await di<CacheHelper>().get('userToken');
}
class Data {
  Object? tag;
  String? id;

  Data({this.id, this.tag});
}