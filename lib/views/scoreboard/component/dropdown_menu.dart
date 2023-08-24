import 'package:flutter/material.dart';

const List<String> list = <String>['Semester 1', 'Semester 2', 'Semester 3', 'Semester 4','Semester 5','Semester 6','Semester 7'];
class DropMenu extends StatelessWidget {
DropMenu({super.key});
String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.list_outlined,color: Color(0xff106FA4),),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (String? value) {
        dropdownValue = value!;
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}