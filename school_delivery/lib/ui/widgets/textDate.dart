import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditTextWidget extends StatefulWidget {
  const EditTextWidget({Key? key}) : super(key: key);

  @override
  State<EditTextWidget> createState() => _EditeTextWidgetState();
}

class _EditeTextWidgetState extends State<EditTextWidget> {
  final dateOfBirthController = TextEditingController(text: "01-01-1990");


  DateTime? dateOfBirth;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          showCursor: true,
          readOnly: true,
          onTap: () {
            showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1940),
                lastDate: DateTime.now())
                .then((date) {
              //code to handle date
              dateOfBirth = date;
              // update Edit text

              if (date == null) {
                setState(() {
                  dateOfBirthController.text = "";
                  print('date is null');
                });
              } else {
                setState(() {
                  print('date in else ');
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  final String formatted = formatter.format(date);
                  dateOfBirthController.text = formatted;
                  print('dateofbirth.txt ${dateOfBirthController.text}');
                });
              }

              print('Date in today:$dateOfBirth');
            });
          },
          controller: dateOfBirthController,
          decoration: _getTextFieldWithCalendarIconDecoration(),
        )
      ],
    );
  }

  InputDecoration _getTextFieldWithCalendarIconDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      suffixIcon: Icon(
        Icons.date_range,
        color: Theme.of(context).primaryColor,
      ),
      hintText: '01-01-2022',
    );
  }
}
