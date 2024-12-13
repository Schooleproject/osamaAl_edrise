import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/Localization/AppLanguage.dart';

class GetxHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLanguage appLanguage = Get.find<AppLanguage>();  // Access the controller

    return GetBuilder<AppLanguage>(  // GetBuilder to listen for updates in AppLanguage
      builder: (value) => Scaffold(
        appBar: AppBar(
          title: Text('home'.tr),  // Translate this text using GetX translation
          actions: [
            IconButton(
              icon: Icon(Icons.language),
              onPressed: () {
                // Switch language
                appLanguage.changeLanguage(
                    appLanguage.appLocal.value == 'ar' ? 'en' : 'ar');
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text that updates when the language changes
              Text(
                'home'.tr,
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () {
                  appLanguage.changeLanguage(
                      appLanguage.appLocal.value == 'ar' ? 'en' : 'ar');
                },
                child: Text('Change Language'),
              ),

              // Add ListView.builder here
              Expanded(
                child: ListView.builder(
                  itemCount: 3,  // You want 3 items in the list
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Item ${index + 1}'),  // Dynamic item content
                      subtitle: Text('This is item number ${index + 1}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
