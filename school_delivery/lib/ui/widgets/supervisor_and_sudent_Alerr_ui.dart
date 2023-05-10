import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/provider_Data_Manager.dart';



class ParentInterface extends StatelessWidget {
  void childMethod(BuildContext? context) {
    showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: Text('Child Alert'),
        content: Text('This is an alert from the child method.'),
        actions: [
          TextButton(
            child: Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final alertsManager = Provider.of<ProviderDataManager>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Parent Interface')),
      body: Column(
        children: [
          Text('Parent Interface'),
          ElevatedButton(
            child: Text('Add Alert'),
            onPressed: () {
              alertsManager.addAlert('Alert from Parent Interface');
              childMethod(context);
            },
          ), // Instantiate ChildClass
        ],
      ),
    );
  }
}

class SupervisorStudentInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alertsManager = Provider.of<ProviderDataManager>(context);
    alertsManager.AlertsManager();

    return Scaffold(
      appBar: AppBar(title: Text('Supervisor Student Interface')),
      body: Column(
        children: [
          Text('Supervisor Student Interface'),
          Expanded(
            child: ListView.builder(
              itemCount: alertsManager.alerts.length,
              itemBuilder: (context, index) {
                final alert = alertsManager.alerts[index];
                print("-------- message :${alertsManager.alerts[index]}:${alert.message} ------------");
                return ListTile(
                  title: Text(alert.message!),
                  subtitle: Text(alert.timestamp.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}