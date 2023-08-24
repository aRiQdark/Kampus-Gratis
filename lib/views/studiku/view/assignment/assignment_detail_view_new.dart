import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/studiku/assignment_controller.dart';
import 'package:kampus_gratis/views/studiku/view/assignment/assignment_selesai.dart';
import 'package:kampus_gratis/widgets/app_bar.dart';
import 'package:kampus_gratis/widgets/scaffold.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;

class AssignmentDetailView extends GetView<AssignmentController> {
  AssignmentDetailView({super.key});
  final _quillController = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var quillEditor = QuillEditor(
      controller: _quillController,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: _focusNode,
      autoFocus: false,
      readOnly: false,
      placeholder: 'Tulis jawab Disini',
      expands: false,
      padding: const EdgeInsets.all(8.0),
    );
    return KGScaffold(
        appBar: const KGAppBar(
            backButton: true, title: 'Detail Tugas', withIconKG: true),
        body: SingleChildScrollView(
          controller: null,
          child: Column(
            children: [
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
                child: Column(
                  children: [
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
                                          margin:
                                              const EdgeInsets.only(top: 10),
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
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      height: 300,
                      padding: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffD9D9D9),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // QuillToolbar.basic(controller: _quillController),
                          QuillToolbar.basic(
                            controller: _quillController,
                            showBackgroundColorButton: false,
                            showCenterAlignment: false,
                            showClearFormat: false,
                            showCodeBlock: false,
                            showColorButton: false,
                            showDirection: false,
                            showDividers: false,
                            showFontFamily: false,
                            showHeaderStyle: false,
                            showInlineCode: false,
                            showJustifyAlignment: false,
                            showLeftAlignment: false,
                            showLink: false,
                            showListCheck: false,
                            showQuote: false,
                            showRedo: false,
                            showRightAlignment: false,
                            showSearchButton: false,
                            showStrikeThrough: false,
                            showUndo: false,
                            showFontSize: false,
                            showSmallButton: true,
                            showAlignmentButtons: false,
                            showIndent: false,
                            toolbarIconAlignment: WrapAlignment.start,
                            toolbarSectionSpacing: 1,
                            toolbarIconSize: 26,
                            customButtons: [
                              QuillCustomButton(
                                icon: Icons.image,
                                onTap: () {},
                              ),
                            ],
                          ),
                          quillEditor,
                          // Container(
                          //   height: 300,
                          //   padding: const EdgeInsets.all(5),
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       width: 1,
                          //       color: Colors.black,
                          //     ),
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   child: quillEditor,
                          // ),
                          // Column(
                          //   children: const [
                          //     Padding(
                          //       padding: EdgeInsets.all(16.0),
                          //       child: TextField(
                          //         decoration: InputDecoration(
                          //             border: InputBorder.none,
                          //             hintText: 'Tulis jawaban disini'),
                          //         style: TextStyle(color: Colors.black),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () => Get.to(const AssignmentSelesai()),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 41),
                          backgroundColor: const Color(0xff106FA4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: const SizedBox(
                          width: 150,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              'Kirim',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
