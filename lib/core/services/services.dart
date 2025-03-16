import 'package:ecommerce/firebase_options.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Myservices extends GetxService{
  late SharedPreferences sharedpref;
  Future<Myservices> init()async{
    sharedpref=await SharedPreferences.getInstance();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    
    return this;
  }

}
initialServices()async{
  await Get.putAsync(() async =>await Myservices().init());
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("=====Back Ground Message============");

  print("=======================${message.notification!.title}");
  print("${message.notification!.body}============================");
}