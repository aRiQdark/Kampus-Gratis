import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/app_bar.dart';
import '../../../../widgets/scaffold.dart';

class AssignmentSelesai extends StatelessWidget {
  const AssignmentSelesai({super.key});

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
        appBar: const KGAppBar(
            backButton: true, title: 'Detail Tugas', withIconKG: true),
        body: SingleChildScrollView(
            controller: null,
            child: Column(children: [
              Container(
                width: Get.width,
                height: 90,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Accounting 1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text('Bob, S.Kom., M.Kom.')
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Column(children: [
                  Container(
                    height: 135,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        border: Border.all(color: const Color(0xffD9D9D9)),
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tugas :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Silahkan Baca dan Kerjakan tugas pada modul\nberikut ini.',
                                  style: TextStyle(color: Colors.black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 300,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: 3,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/iconFile.png',
                                                  height: 25,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  'Tugas Accounting 1.pdf',
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: const [
                      Text('Batas pengumpulan Tugas :'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '04 Des 2022, 23:59',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Jawaban terkirim',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: const Offset(0, 1),
                                      )
                                    ]),
                                height: 100,
                                width: Get.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            'assets/icons/iconFile.png',
                                            height: 25,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Jawaban Accounting 11_Jimmy.pdf',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text('Terkirim'),
                                                  Text(
                                                    '03 Des 2022',
                                                  ),
                                                  Text('16.43'),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  Text(
                                                    'Edit',
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              )
            ])));
  }
}
