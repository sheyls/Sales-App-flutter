import 'package:flutter/material.dart';
import 'package:induccion_flutter/services/local_storage_service.dart';

class MyHomePage extends StatelessWidget {
  final storageService = LocalStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Storage Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await storageService.saveData('username', 'Sheyla');
              },
              child: Text('Save Data'),
            ),
            ElevatedButton(
              onPressed: () {
                String? username = storageService.getData<String>('username');
                print('Username: $username');
              },
              child: Text('Get Data'),
            ),
          ],
        ),
      ),
    );
  }
}
