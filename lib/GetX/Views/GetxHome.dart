import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/Localization/AppLanguage.dart';
import '../../helpers/Localization/localization.dart'; // تأكد من استيراد localization.dart

class GetxHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(Localization.translate('home', appLanguage.appLocal)), // استخدام الترجمة
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              // تغيير اللغة
              appLanguage.changeLanguage(appLanguage.appLocal == 'ar' ? 'en' : 'ar');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Localization.translate('home', appLanguage.appLocal), // استخدام الترجمة
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                appLanguage.changeLanguage(appLanguage.appLocal == 'ar' ? 'en' : 'ar');
              },
              child: Text(Localization.translate('change_language', appLanguage.appLocal)), // استخدام الترجمة
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Localization.translate('item', appLanguage.appLocal) + ' ${index + 1}'),
                    subtitle: Text(Localization.translate('item_description', appLanguage.appLocal) + ' ${index + 1}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}