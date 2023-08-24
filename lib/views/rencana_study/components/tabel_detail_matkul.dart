import 'package:flutter/material.dart';

import '../../../models/silabus/table_model.dart';

class TabelDetailMatkul extends StatelessWidget {
  TabelDetailMatkul({super.key});

  final List<TableModel> tableModel = [
    TableModel('Kompetensi Dasar'),
    TableModel('Indikator'),
    TableModel('Pengalaman Pembelajaran'),
    TableModel('Materi Ajar'),
    TableModel('Waktu'),
    TableModel('Alat, Bahan, Sumber belajar'),
    TableModel('Penilaian'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(140),
          1: FlexColumnWidth()
        },
        border: TableBorder.all(
          width: 2,
          borderRadius: BorderRadius.circular(10),
        ),
        children: tableModel
            .map(
              (data) => TableRow(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 44),
                    child: Center(
                      child: SizedBox(
                        width: 100,
                        child: Text(
                          data.topic,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const Text('')
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
