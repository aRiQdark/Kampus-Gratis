import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/discussion_global/discussion_global_controller.dart';
import 'package:kampus_gratis/themes/themes.dart';
import 'package:tuple/tuple.dart';

class DiscussionGlobalAddView extends GetView<DiscussionGlobalController> {
  const DiscussionGlobalAddView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var quillEditor = QuillEditor(
      controller: controller.quillController,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: controller.focusNode,
      autoFocus: false,
      readOnly: false,
      placeholder: 'Tulis ini diskusi anda disini...',
      expands: false,
      padding: const EdgeInsets.all(8.0),
      customStyles: DefaultStyles(
        placeHolder: DefaultTextBlockStyle(
          Themes.lightTheme.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: const Color(0xFF383838),
          ),
          const Tuple2(16, 0),
          const Tuple2(0, 0),
          null,
        ),
        paragraph: DefaultTextBlockStyle(
          Themes.lightTheme.textTheme.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: const Color(0xFF383838),
          ),
          const Tuple2(16, 0),
          const Tuple2(0, 0),
          null,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: Get.width,
                height: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFF106FA4),
                ),
                child: Center(
                  child: Text(
                    'Apa yang mau di Diskusikan?',
                    style: Themes.lightTheme.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: const Color(0xFFFAFAFA),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Title',
                style: Themes.lightTheme.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xFF383838),
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Title cannot empty';
                //   }
                //   return null;
                // },
                controller: controller.titleController,
                minLines: 4,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide(
                      width: 10,
                      color: Colors.red,
                      // color: Color(0xFFD9D9D9),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(0xFFFAFAFA),
                  contentPadding: EdgeInsets.all(10),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintText: 'Tulis judul anda disini',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Color(0xFF383838),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Isi Diskusi',
                style: Themes.lightTheme.textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xFF383838),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 280,
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFD9D9D9),
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xFFFAFAFA),
                ),
                child: quillEditor,
              ),
              const SizedBox(height: 20),
              QuillToolbar.basic(
                controller: controller.quillController,
                showBackgroundColorButton: false,
                showClearFormat: false,
                showCodeBlock: false,
                showColorButton: false,
                showDirection: false,
                showDividers: false,
                showFontFamily: false,
                showHeaderStyle: false,
                showInlineCode: false,
                showAlignmentButtons: true,
                showLink: false,
                showListCheck: false,
                showQuote: false,
                showRedo: false,
                showSearchButton: false,
                showStrikeThrough: false,
                showUndo: false,
                showFontSize: false,
                showSmallButton: true,
                showIndent: false,
                toolbarIconAlignment: WrapAlignment.start,
                toolbarSectionSpacing: 2,
                toolbarIconSize: 24,
                customButtons: [
                  QuillCustomButton(
                    icon: Icons.image,
                    onTap: () {},
                  ),
                ],
                iconTheme: const QuillIconTheme(
                  borderRadius: 8,
                  iconSelectedFillColor: Color(0xFF106FA4),
                  iconUnselectedFillColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () async {
                    if (controller.quillController.document.toPlainText() !=
                            '' &&
                        controller.titleController.text != '') {
                      await controller.postMakeDf(
                        controller.titleController.text,
                        controller.quillController.document.toPlainText(),
                      );
                    } else {
                      Get.snackbar(
                        'Warning',
                        'Title atau Content tidak boleh kosong',
                        icon: const Icon(Icons.send),
                        backgroundColor: Colors.orange,
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: const Color(0xFFFAFAFA),
                      );
                    }
                  },
                  child: Container(
                    width: 99,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF106FA4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Kirim',
                          style:
                              Themes.lightTheme.textTheme.subtitle1!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: const Color(0xFFFAFAFA),
                          ),
                        ),
                        SvgPicture.asset('assets/icons/send.svg'),
                      ],
                    ),
                  ),
                ),

                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: const Color(0xFF4895EF),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                //   child: const SizedBox(
                //     width: 150,
                //     child: Padding(
                //       padding: EdgeInsets.all(12.0),
                //       child: Text(
                //         'Post',
                //         style: TextStyle(
                //           fontSize: 14,
                //           color: Colors.white,
                //           fontWeight: FontWeight.w600,
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),

      // Padding(
      //   padding: const EdgeInsets.all(16),
      //   child: Form(
      //     key: _formKey,
      //     child: Column(
      //       children: [
      //         PrimaryTextField(
      //           controller: _titleController,
      //           hintText: 'Judul',
      //           validator: (value) {
      //             if (value!.isEmpty) {
      //               return ("Title is required");
      //             }
      //             return null;
      //           },
      //         ),

      // Column(
      //   children: [
      //     quill.QuillToolbar.basic(controller: _quillController),
      //     Expanded(
      //       child: Container(
      //         child: quill.QuillEditor.basic(
      //           controller: _quillController,
      //           readOnly: false, // true for view only mode
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // PrimaryTextField(
      //   controller: _descController,
      //   hintText: 'Ketik disni...',
      //   isMulti: true,
      //   validator: (value) {
      //     if (value!.isEmpty) {
      //       return ("This is required");
      //     }
      //     return null;
      //   },
      // ),
      // ElevatedButton(
      //   onPressed: () {},
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: const Color(0xFF0E69D3),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //   ),
      //   child: const SizedBox(
      //     width: double.infinity,
      //     child: Text(
      //       'Post',
      //       style: TextStyle(
      //         fontSize: 14,
      //         color: Colors.white,
      //         fontWeight: FontWeight.w600,
      //       ),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
