import 'package:flutter/material.dart';
import 'package:flutter_full_ux_ix/1.Presentation/pages/integration/notification_local/service_local_notification.dart';

class NotificationLocalPage extends StatelessWidget {
  const NotificationLocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification Local"),),
      body:const  Center(child: Text("Prueba de envio de notification"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
       LocalNotifications().requestPermissionLocalNotifications();
       Future.delayed(const Duration(seconds: 3),(){
        LocalNotifications.showLocalNotification(id: 1,title: "Perro Miguel",body: "Miguel Chupalo",data: "Daaaaaatttaaa");
       });
      }),
    );
  }
}