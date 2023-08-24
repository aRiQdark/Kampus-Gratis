// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/onboarding/onboarding_controller.dart';
import 'package:kampus_gratis/utils/constants.dart';
import 'package:kampus_gratis/views/onboarding/component/animation.dart';
import 'package:kampus_gratis/views/onboarding/component/item_pageview.dart';
import 'package:kampus_gratis/views/onboarding/component/skip_button.dart';
import 'package:kampus_gratis/views/onboarding/component/start_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: const Color(0xff106FA4),
          child: Obx(
            () => Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: itemPageView.length,
                    onPageChanged: (newIndex) {
                      print(controller.currentIndex.value);
                      controller.currentIndex.value = newIndex;
                    },
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return SizedBox(
                        width: size.width,
                        height: size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              if (controller.currentIndex.value == 3) ...[
                                const SizedBox(
                                  height: 31,
                                ),
                                SizedBox(
                                  width: 147,
                                  height: 54,
                                  child: animation(
                                    index,
                                    100,
                                    Image.asset('assets/images/logo2.png'),
                                  ),
                                ),
                              ],

                              /// IMG
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(15, 40, 15, 10),
                                width: size.width,
                                height: size.height / 2.5,
                                child: animation(
                                  index,
                                  100,
                                  Image.asset(itemPageView[index].img),
                                ),
                              ),

                              /// TITLE TEXT
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 25, bottom: 15),
                                  child: animation(
                                    index,
                                    300,
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Text(
                                        itemPageView[index].title,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  )),

                              /// SUBTITLE TEXT
                              animation(
                                index,
                                500,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Text(
                                    itemPageView[index].subTitle,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// PAGE INDICATOR
                      SmoothPageIndicator(
                        controller: controller.pageController,
                        count: itemPageView.length,
                        effect: const ExpandingDotsEffect(
                          spacing: 6.0,
                          radius: 10.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          expansionFactor: 3.8,
                          dotColor: Colors.grey,
                          activeDotColor: Color(0xFF4786ec),
                        ),
                        onDotClicked: (newIndex) {
                          controller.currentIndex.value = newIndex;
                          controller.pageController.animateToPage(newIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                      ),

                      const SizedBox(height: 10),

                      controller.currentIndex.value == 3

                          /// GET STARTED BTN
                          ? StartBtn(
                              // size: size,
                              onTap: () => Get.offAllNamed('/login'),
                            )

                          /// SKIP BTN
                          : SkipBtn(
                              // size: size,
                              onTap: () {
                                controller.pageController.animateToPage(3,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.fastOutSlowIn);
                              },
                            ),
                      if (controller.currentIndex.value == 3) ...[
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Belum punya akun?',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed('/register');
                              },
                              child: const Text(
                                'Daftar sekarang',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff15C8A8),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
// Scaffold(
//         body: SingleChildScrollView(
//       child:   Container(
//         width: Get.width,
//         height: Get.height,
//         child:Obx(() =>  Column(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: SizedBox(
//                     height: Get.height,
//                     child: PageView.builder(
//                       controller: controller.pageController,
                      
//                       onPageChanged: (newindex) {
//                         controller.currentIndex.value = newindex;
//                       },
//                       itemCount: Item.length,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         return  SizedBox(
//                           width: Get.width,
//                           height: Get.height,
//                           child: SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 if (controller.currentIndex.value == 3) ...[
//                                   const SizedBox(
//                                     height: 31,
//                                   ),
//                                   SizedBox(
//                                     width: 147,
//                                     height: 54,
//                                     child: animation(
//                                       index,
//                                       100,
//                                       Image.asset('assets/images/logo2.png'),
//                                     ),
//                                   ),
//                                 ], 
                        
                        
//                         Column(
//                           // ignore: prefer_const_literals_to_create_immutables
//                           children: [
//                             const SizedBox(
//                               height: 30,
//                             ),
//                             Padding(
//                                 padding: const EdgeInsets.only(top: 25, bottom: 15),
//                                 child: animation(
//                                   index,
//                                   300,
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 20, right: 20),
//                                     child: Text(
//                                       Item[index].title,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                           fontSize: 25, fontWeight: FontWeight.w600),
//                                     ),
//                                   ),
//                                 )),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             const SizedBox(
//                               height: 50,
//                             ),
//                             Container(
//                               margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
//                               width: 300,
//                               height: 300,
//                               child: animation(
//                                 index,
//                                 100,
//                                 Image.asset(Item[index].img,),
//                               ),
//                             ),
//                             SizedBox(height: 50,),
                            
//                             animation(
//                               index,
//                               500,
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20, right: 20),
//                                 child: SizedBox(
//                                   width: 180,
//                                   height: 40,
//                                   child: ElevatedButton(
//                                     onPressed: () => Get.toNamed('/Log-in'),
//                                     style: ElevatedButton.styleFrom(
//                                       elevation: 0,
//                                       backgroundColor: Colors.green,
//                                     ),
//                                     child: Icon(Icons.arrow_forward_outlined),
//                                   ),
//                                 ),
//                               ),
//                             ),
                            
//                             SizedBox(
//                               height: 10,
//                             ),
                            
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             animation(index, 500, Text(Item[index].titledown,style: TextStyle(fontSize: 20),)),
//                             SizedBox(height: 30,),
//                             animation(
//                               index,
//                               500,
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 20, right: 20),
//                                 child: Text(
//                                   Item[index].txt,
//                                   textAlign: TextAlign.center,
//                                   style: const TextStyle(
//                                       fontSize: 20, fontWeight: FontWeight.w200),
//                                 ),
//                               ),)
//                             ,
//                           ],
//                         )])));
//                       },
//                     ),
//                   )),
//             ),
               
               
//           ],
//         ),)
//       ),
//     ),
//     )