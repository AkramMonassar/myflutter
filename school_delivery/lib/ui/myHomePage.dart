import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_delivery/ui/users_Interface5.dart';

import '../Provider/provider_Data_Manager.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("&&&&&&&&&&&&&& from myHomePage screen &&&&&&&&&&&&&&& ");
    // Provider.of<ProviderDataManager>(context).selectManager=_selectedOptionIndex;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Options"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select an option:',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            DropdownButton<int>(
              value: _selectedOptionIndex,
              onChanged: (int? newIndex) {
                setState(() {
                  _selectedOptionIndex = newIndex!;
                });
              },
              items: <String>['مسؤول الحركة', 'مشرف الباص', 'ولي امر طالب']
                  .asMap()
                  .entries
                  .map<DropdownMenuItem<int>>((entry) {
                return DropdownMenuItem<int>(
                  value: entry.key,
                  child: Text(entry.value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),
            _buildSecondInterface(context),
          ],
        ),
      ),
    );
  }
  void _updateVariable(BuildContext? context) {
      if(context!=null)
        {
          ProviderDataManager provider = Provider.of<ProviderDataManager>(context, listen: false);
          provider.setMyVariable(_selectedOptionIndex);
          print("------------ From _UpdateMethod ------------------- ");
        }
      else{
        print("context is null --------------- ");
      }
  }

  Widget _buildSecondInterface(BuildContext context) {
    if (_selectedOptionIndex == null) {
      return const SizedBox.shrink();

    } else if (_selectedOptionIndex == 0) {
      print("index : ${_selectedOptionIndex}");
      return ElevatedButton(
          onPressed: () {
            print("------------ From 1 ElevatedButton index 0  (context):${context}------------------- ");
            ProviderDataManager provider = Provider.of<ProviderDataManager>(context,listen: false);
            print("------------ From 2 ElevatedButton index 0  (context):${context}------------------- ");
            provider.setMyVariable(_selectedOptionIndex);
            print("------------ From ElevatedButton index 0 ------------------- ");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserInterface5()));
          },
          child: const Text("مسؤوال الحركة"));
    } else if (_selectedOptionIndex == 1) {
      print("index : ${_selectedOptionIndex}");
      return ElevatedButton(
          onPressed: () {
            print("------------ From 1 ElevatedButton index 1 ------------------- ");
            _updateVariable(context);
            print("------------ From ElevatedButton index 1 ------------------- ");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserInterface5()));
          },
          child: const Text("مشرف الباص"));

    } else if (_selectedOptionIndex == 2) {
      print("index : ${_selectedOptionIndex}");

      return ElevatedButton(
          onPressed: () {
            print("------------ From 1 ElevatedButton index 2 ------------------- ");
            _updateVariable(context);
            print("------------ From ElevatedButton index 2 ------------------- ");
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserInterface5()));
          },
          child: const Text("ولي امر الطالب"));
    } else {
      return const SizedBox.shrink();
    }
  }
}
