import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kampus_gratis/controllers/Kalender/kalender_controller.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../widgets/app_bar.dart';
import '../../../widgets/scaffold.dart';

class KalenderView extends GetView<KalenderController> {
  const KalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return KGScaffold(
      appBar: const KGAppBar(
          backButton: true, title: 'Kalendar Saya', withIconKG: true),
      body: controller.obx(
        (data) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Obx(
                () => TableCalendar(
                  firstDay: DateTime(2022),
                  lastDay: DateTime(2023),
                  focusedDay: controller.focusedDay,
                  calendarFormat: controller.calendarFormat,
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(controller.selectedDate, selectedDay)) {
                      // Call `setState()` when updating the selected day

                      controller.selectedDate = selectedDay;
                      controller.focusedDay = focusedDay;
                    }
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(controller.selectedDate, day);
                  },
                  onFormatChanged: (format) {
                    if (controller.calendarFormat != format) {
                      // Call `setState()` when updating )calendar format

                      controller.calendarFormat = format;
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    controller.focusedDay = focusedDay;
                  },
                  eventLoader: controller.listOfDayEvents,
                ),
                // controller.listOfDayEvents(DateTime.now()).map(
                //       (myEvents) => ListTile(
                //         leading: const Icon(
                //           Icons.done,
                //           color: Colors.teal,
                //         ),
                //         title: Padding(
                //           padding: const EdgeInsets.only(bottom: 8.0),
                //           child:
                //               Text('Event Title:   ${myEvents['eventTitle']}'),
                //         ),
                //         subtitle:
                //             Text('Description:   ${myEvents['eventDescp']}'),
                //       ),
                //     ),
                // TableCalendar(
                //   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                //   locale: 'en_US',
                //   firstDay: kFirstDay,
                //   calendarBuilders: CalendarBuilders(
                //     markerBuilder: (BuildContext context, date, events) {
                //       if (events.isEmpty) return const SizedBox();
                //       return ListView.builder(
                //           shrinkWrap: true,
                //           scrollDirection: Axis.horizontal,
                //           itemCount: events.length,
                //           itemBuilder: (context, index) {
                //             return Container(
                //               margin: const EdgeInsets.only(top: 20),
                //               padding: const EdgeInsets.all(1),
                //               child: Container(
                //                 // height: 7,
                //                 width: 5,
                //                 decoration: BoxDecoration(
                //                     shape: BoxShape.circle,
                //                     color: Colors.primaries[Random()
                //                         .nextInt(Colors.primaries.length)]),
                //               ),
                //             );
                //           });
                //     },
                //   ),
                //   lastDay: kLastDay,
                //   focusedDay: _focusedDay,
                //   calendarFormat: _calendarFormat,
                //   eventLoader: _listOfDayEvents,
                //   rangeStartDay: _rangeStart,
                //   rangeEndDay: _rangeEnd,
                //   rangeSelectionMode: _rangeSelectionMode,
                //   onDaySelected: _onDaySelected,
                //   onRangeSelected: _onRangeSelected,
                //   calendarStyle: CalendarStyle(
                //       tablePadding: const EdgeInsets.only(left: 22, right: 22),
                //       tableBorder:
                //           TableBorder(borderRadius: BorderRadius.circular(4)),
                //       isTodayHighlighted: false,
                //       todayDecoration: BoxDecoration(
                //           shape: BoxShape.rectangle,
                //           color: Colors.green,
                //           borderRadius: BorderRadius.circular(5)),
                //       holidayDecoration: BoxDecoration(
                //         shape: BoxShape.rectangle,
                //         color: Colors.red,
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       markerDecoration: const BoxDecoration(
                //           color: Colors.blue, shape: BoxShape.circle)),
                //   onFormatChanged: (format) {
                //     if (_calendarFormat != format) {
                //       setState(() {
                //         _calendarFormat = format;
                //       });
                //     }
                //   },
                //   onPageChanged: (focusedDay) {
                //     _focusedDay = focusedDay;
                //   },
                //   headerStyle: const HeaderStyle(
                //       formatButtonVisible: false, titleCentered: true),
                // ),
                // const SizedBox(
                //   height: 26,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 28),
                //   child: Row(
                //     children: [
                //       Row(
                //         children: [
                //           Container(
                //               height: 5,
                //               width: 5,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: const Color(0xff9747FF),
                //               )),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Acara Kampus',
                //             style: TextStyle(fontSize: 8),
                //           ),
                //           const SizedBox(
                //             width: 23.5,
                //           ),
                //           Row(
                //             children: [
                //               Container(
                //                   height: 5,
                //                   width: 5,
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(5),
                //                     color: const Color(0xffFDB415),
                //                   )),
                //               const SizedBox(
                //                 width: 5,
                //               ),
                //               const Text(
                //                 'Tugas',
                //                 style: TextStyle(fontSize: 8),
                //               ),
                //               const SizedBox(
                //                 width: 23.5,
                //               ),
                //               Row(
                //                 children: [
                //                   Container(
                //                       height: 5,
                //                       width: 5,
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(5),
                //                         color: const Color(0xff3AAA35),
                //                       )),
                //                   const SizedBox(
                //                     width: 5,
                //                   ),
                //                   const Text(
                //                     'Uas',
                //                     style: TextStyle(fontSize: 8),
                //                   ),
                //                   const SizedBox(
                //                     width: 23.5,
                //                   ),
                //                 ],
                //               ),
                //               Row(
                //                 children: [
                //                   Container(
                //                       height: 5,
                //                       width: 5,
                //                       decoration: BoxDecoration(
                //                         borderRadius: BorderRadius.circular(5),
                //                         color: const Color(0xff106FA4),
                //                       )),
                //                   const SizedBox(
                //                     width: 5,
                //                   ),
                //                   const Text(
                //                     'Uas',
                //                     style: TextStyle(fontSize: 8),
                //                   ),
                //                   const SizedBox(
                //                     width: 23.5,
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Container(
                //               height: 5,
                //               width: 5,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: const Color(0xffEE2D24),
                //               )),
                //           const SizedBox(
                //             width: 5,
                //           ),
                //           const Text(
                //             'Jadwal Simulasi',
                //             style: TextStyle(fontSize: 8),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(
                //   height: 24,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 36),
                //   child: const Text(
                //     'Acara Terdekat',
                //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // const SizedBox(
                //   height: 14,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 22, right: 22),
                //   child: Container(
                //     height: 188,
                //     width: 316,
                //     decoration: BoxDecoration(
                //         border: Border.all(
                //           color: const Color(0xffD9D9D9),
                //         ),
                //         borderRadius: BorderRadius.circular(4)),
                //     child: SizedBox(
                //       height: 400,
                //       child: Padding(
                //         padding: const EdgeInsets.all(2.0),
                //         child: ValueListenableBuilder<List<Event>>(
                //           valueListenable: _selectedEvents,
                //           builder: (context, value, _) {
                //             return ListView.builder(
                //               itemCount: value.length,
                //               itemBuilder: (context, index) {
                //                 return Container(
                //                   margin: const EdgeInsets.symmetric(
                //                     horizontal: 12.0,
                //                     vertical: 4.0,
                //                   ),
                //                   decoration: BoxDecoration(
                //                     border: const Border.symmetric(
                //                         horizontal: BorderSide.none),
                //                     borderRadius: BorderRadius.circular(12.0),
                //                   ),
                //                   child: ListTile(
                //                     onTap: () => print('${value[index]}'),
                //                     title: Container(
                //                       padding: const EdgeInsets.all(16),
                //                       decoration: BoxDecoration(
                //                         color: Colors.primaries[Random()
                //                             .nextInt(Colors.primaries.length)],
                //                         borderRadius: BorderRadius.circular(10),
                //                       ),
                //                       height: 50,
                //                       width: 50,
                //                       child: Text(
                //                         '${value[index]}',
                //                         style: const TextStyle(fontSize: 12),
                //                       ),
                //                     ),
                //                   ),
                //                 );
                //               },
                //             );
                //           },
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:kampus_gratis/views/kalender/view/event_model.dart';
// import 'package:kampus_gratis/widgets/app_bar.dart';
// import 'package:kampus_gratis/widgets/scaffold.dart';
// import 'package:table_calendar/table_calendar.dart';

// class KalenderView extends StatefulWidget {
//   const KalenderView({super.key});

//   @override
//   State<KalenderView> createState() => _KalenderViewState();
// }

// class _KalenderViewState extends State<KalenderView> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
  //     .toggledOff; // Can be toggled on/off by longpressing a date
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;
  // DateTime? _rangeStart;
  // DateTime? _rangeEnd;
  // Map<String, List>? mySelectedEvents = {};
  // DateTime? _selectedDate;

  // @override
  // void initState() {
  //   super.initState();

  //   _selectedDay = _focusedDay;
  //   // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

  //   mySelectedEvents = {
  //     "2022-12-1": [
  //       {"eventDescp": "11", "eventTitle": "111"},
  //       {"eventDescp": "11", "eventTitle": "111"},
  //     ],
  //     "2022-12-12": [
  //       {"eventDescp": "22", "eventTitle": "22"}
  //     ],
  //     "2022-12-08981": [
  //       {"eventTitle": "ss", "eventDescp": "ss"}
  //     ]
  //   };
  // }

  // @override
  // void dispose() {
  //   _selectedEvents.dispose();
  //   super.dispose();
  // }

  // List _listOfDayEvents(DateTime dateTime) {
  //   if (mySelectedEvents![DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
  //     return mySelectedEvents![DateFormat('yyyy-MM-dd').format(dateTime)]!;
  //   } else {
  //     return [];
  //   }
  // }

//   // List<Event> _getEventsForDay(DateTime day) {
//   //   return kEvents[day] ?? [];
//   // }

//   // void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//   //   if (!isSameDay(_selectedDay, selectedDay)) {
//   //     setState(() {
//   //       _selectedDay = selectedDay;
//   //       _focusedDay = focusedDay;
//   //       _rangeStart = null; // Important to clean those
//   //       _rangeEnd = null;
//   //       _rangeSelectionMode = RangeSelectionMode.toggledOff;
//   //     });

//   //     _selectedEvents.value = _getEventsForDay(selectedDay);
//   //   }
//   // }

//   // void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//   //   setState(() {
//   //     _selectedDay = null;
//   //     _focusedDay = focusedDay;
//   //     _rangeStart = start;
//   //     _rangeEnd = end;
//   //     _rangeSelectionMode = RangeSelectionMode.toggledOn;
//   //   });
//   //   List<Event> _getEventsForRange(DateTime start, DateTime end) {
//   //     final days = daysInRange(start, end);

//   //     return [
//   //       for (final d in days) ..._getEventsForDay(d),
//   //     ];
//   //   }

//   //   // `start` or `end` could be null
//   //   if (start != null && end != null) {
//   //     _selectedEvents.value = _getEventsForRange(start, end);
//   //   } else if (start != null) {
//   //     _selectedEvents.value = _getEventsForDay(start);
//   //   } else if (end != null) {
//   //     _selectedEvents.value = _getEventsForDay(end);
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return KGScaffold(
//         appBar: const KGAppBar(
//             backButton: true, title: 'Kalendar Saya', withIconKG: true),
//         body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ListView(children: [
//               TableCalendar(
//                 firstDay: DateTime(2022),
//                 lastDay: DateTime(2023),
//                 focusedDay: _focusedDay,
//                 calendarFormat: _calendarFormat,
//                 onDaySelected: (selectedDay, focusedDay) {
//                   if (!isSameDay(_selectedDate, selectedDay)) {
//                     // Call `setState()` when updating the selected day
//                     setState(() {
//                       _selectedDate = selectedDay;
//                       _focusedDay = focusedDay;
//                     });
//                   }
//                 },
//                 selectedDayPredicate: (day) {
//                   return isSameDay(_selectedDate, day);
//                 },
//                 onFormatChanged: (format) {
//                   if (_calendarFormat != format) {
//                     // Call `setState()` when updating calendar format
//                     setState(() {
//                       _calendarFormat = format;
//                     });
//                   }
//                 },
//                 onPageChanged: (focusedDay) {
//                   // No need to call `setState()` here
//                   _focusedDay = focusedDay;
//                 },
//                 eventLoader: _listOfDayEvents,
//               ),
//               ..._listOfDayEvents(DateTime.now()).map(
//                 (myEvents) => ListTile(
//                   leading: const Icon(
//                     Icons.done,
//                     color: Colors.teal,
//                   ),
//                   title: Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: Text('Event Title:   ${myEvents['eventTitle']}'),
//                   ),
//                   subtitle: Text('Description:   ${myEvents['eventDescp']}'),
//                 ),
//               ),
//               // TableCalendar(
//               //   selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//               //   locale: 'en_US',
//               //   firstDay: kFirstDay,
//               //   calendarBuilders: CalendarBuilders(
//               //     markerBuilder: (BuildContext context, date, events) {
//               //       if (events.isEmpty) return const SizedBox();
//               //       return ListView.builder(
//               //           shrinkWrap: true,
//               //           scrollDirection: Axis.horizontal,
//               //           itemCount: events.length,
//               //           itemBuilder: (context, index) {
//               //             return Container(
//               //               margin: const EdgeInsets.only(top: 20),
//               //               padding: const EdgeInsets.all(1),
//               //               child: Container(
//               //                 // height: 7,
//               //                 width: 5,
//               //                 decoration: BoxDecoration(
//               //                     shape: BoxShape.circle,
//               //                     color: Colors.primaries[Random()
//               //                         .nextInt(Colors.primaries.length)]),
//               //               ),
//               //             );
//               //           });
//               //     },
//               //   ),
//               //   lastDay: kLastDay,
//               //   focusedDay: _focusedDay,
//               //   calendarFormat: _calendarFormat,
//               //   eventLoader: _listOfDayEvents,
//               //   rangeStartDay: _rangeStart,
//               //   rangeEndDay: _rangeEnd,
//               //   rangeSelectionMode: _rangeSelectionMode,
//               //   onDaySelected: _onDaySelected,
//               //   onRangeSelected: _onRangeSelected,
//               //   calendarStyle: CalendarStyle(
//               //       tablePadding: const EdgeInsets.only(left: 22, right: 22),
//               //       tableBorder:
//               //           TableBorder(borderRadius: BorderRadius.circular(4)),
//               //       isTodayHighlighted: false,
//               //       todayDecoration: BoxDecoration(
//               //           shape: BoxShape.rectangle,
//               //           color: Colors.green,
//               //           borderRadius: BorderRadius.circular(5)),
//               //       holidayDecoration: BoxDecoration(
//               //         shape: BoxShape.rectangle,
//               //         color: Colors.red,
//               //         borderRadius: BorderRadius.circular(5),
//               //       ),
//               //       markerDecoration: const BoxDecoration(
//               //           color: Colors.blue, shape: BoxShape.circle)),
//               //   onFormatChanged: (format) {
//               //     if (_calendarFormat != format) {
//               //       setState(() {
//               //         _calendarFormat = format;
//               //       });
//               //     }
//               //   },
//               //   onPageChanged: (focusedDay) {
//               //     _focusedDay = focusedDay;
//               //   },
//               //   headerStyle: const HeaderStyle(
//               //       formatButtonVisible: false, titleCentered: true),
//               // ),
//               const SizedBox(
//                 height: 26,
//               ),
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 28),
//               //   child: Row(
//               //     children: [
//               //       Row(
//               //         children: [
//               //           Container(
//               //               height: 5,
//               //               width: 5,
//               //               decoration: BoxDecoration(
//               //                 borderRadius: BorderRadius.circular(5),
//               //                 color: const Color(0xff9747FF),
//               //               )),
//               //           const SizedBox(
//               //             width: 5,
//               //           ),
//               //           const Text(
//               //             'Acara Kampus',
//               //             style: TextStyle(fontSize: 8),
//               //           ),
//               //           const SizedBox(
//               //             width: 23.5,
//               //           ),
//               //           Row(
//               //             children: [
//               //               Container(
//               //                   height: 5,
//               //                   width: 5,
//               //                   decoration: BoxDecoration(
//               //                     borderRadius: BorderRadius.circular(5),
//               //                     color: const Color(0xffFDB415),
//               //                   )),
//               //               const SizedBox(
//               //                 width: 5,
//               //               ),
//               //               const Text(
//               //                 'Tugas',
//               //                 style: TextStyle(fontSize: 8),
//               //               ),
//               //               const SizedBox(
//               //                 width: 23.5,
//               //               ),
//               //               Row(
//               //                 children: [
//               //                   Container(
//               //                       height: 5,
//               //                       width: 5,
//               //                       decoration: BoxDecoration(
//               //                         borderRadius: BorderRadius.circular(5),
//               //                         color: const Color(0xff3AAA35),
//               //                       )),
//               //                   const SizedBox(
//               //                     width: 5,
//               //                   ),
//               //                   const Text(
//               //                     'Uas',
//               //                     style: TextStyle(fontSize: 8),
//               //                   ),
//               //                   const SizedBox(
//               //                     width: 23.5,
//               //                   ),
//               //                 ],
//               //               ),
//               //               Row(
//               //                 children: [
//               //                   Container(
//               //                       height: 5,
//               //                       width: 5,
//               //                       decoration: BoxDecoration(
//               //                         borderRadius: BorderRadius.circular(5),
//               //                         color: const Color(0xff106FA4),
//               //                       )),
//               //                   const SizedBox(
//               //                     width: 5,
//               //                   ),
//               //                   const Text(
//               //                     'Uas',
//               //                     style: TextStyle(fontSize: 8),
//               //                   ),
//               //                   const SizedBox(
//               //                     width: 23.5,
//               //                   ),
//               //                 ],
//               //               ),
//               //             ],
//               //           ),
//               //         ],
//               //       ),
//               //       Row(
//               //         children: [
//               //           Container(
//               //               height: 5,
//               //               width: 5,
//               //               decoration: BoxDecoration(
//               //                 borderRadius: BorderRadius.circular(5),
//               //                 color: const Color(0xffEE2D24),
//               //               )),
//               //           const SizedBox(
//               //             width: 5,
//               //           ),
//               //           const Text(
//               //             'Jadwal Simulasi',
//               //             style: TextStyle(fontSize: 8),
//               //           ),
//               //         ],
//               //       ),
//               //     ],
//               //   ),
//               // ),
//               // const SizedBox(
//               //   height: 24,
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 36),
//               //   child: const Text(
//               //     'Acara Terdekat',
//               //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               //   ),
//               // ),
//               // const SizedBox(
//               //   height: 14,
//               // ),
//               // Padding(
//               //   padding: const EdgeInsets.only(left: 22, right: 22),
//               //   child: Container(
//               //     height: 188,
//               //     width: 316,
//               //     decoration: BoxDecoration(
//               //         border: Border.all(
//               //           color: const Color(0xffD9D9D9),
//               //         ),
//               //         borderRadius: BorderRadius.circular(4)),
//               //     child: SizedBox(
//               //       height: 400,
//               //       child: Padding(
//               //         padding: const EdgeInsets.all(2.0),
//               //         child: ValueListenableBuilder<List<Event>>(
//               //           valueListenable: _selectedEvents,
//               //           builder: (context, value, _) {
//               //             return ListView.builder(
//               //               itemCount: value.length,
//               //               itemBuilder: (context, index) {
//               //                 return Container(
//               //                   margin: const EdgeInsets.symmetric(
//               //                     horizontal: 12.0,
//               //                     vertical: 4.0,
//               //                   ),
//               //                   decoration: BoxDecoration(
//               //                     border: const Border.symmetric(
//               //                         horizontal: BorderSide.none),
//               //                     borderRadius: BorderRadius.circular(12.0),
//               //                   ),
//               //                   child: ListTile(
//               //                     onTap: () => print('${value[index]}'),
//               //                     title: Container(
//               //                       padding: const EdgeInsets.all(16),
//               //                       decoration: BoxDecoration(
//               //                         color: Colors.primaries[Random()
//               //                             .nextInt(Colors.primaries.length)],
//               //                         borderRadius: BorderRadius.circular(10),
//               //                       ),
//               //                       height: 50,
//               //                       width: 50,
//               //                       child: Text(
//               //                         '${value[index]}',
//               //                         style: const TextStyle(fontSize: 12),
//               //                       ),
//               //                     ),
//               //                   ),
//               //                 );
//               //               },
//               //             );
//               //           },
//               //         ),
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(
//                 height: 16,
//               ),
//             ])));
//   }
// }
