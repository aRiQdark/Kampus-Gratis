import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kampus_gratis/services/providers/kalender/Kalender_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class KalenderController extends GetxController with StateMixin {
  final KalenderProvider _kalenderProvider;

  KalenderController(this._kalenderProvider);

  // List<> mySelectedEvents = {
  //   "2022-12-1": [
  //     {"eventDescp": "11", "eventTitle": "111"},
  //     {"eventDescp": "11", "eventTitle": "111"},
  //   ],
  //   "2022-12-12": [
  //     {"eventDescp": "22", "eventTitle": "22"}
  //   ],
  //   "2022-12-08981": [
  //     {"eventTitle": "ss", "eventDescp": "ss"}
  //   ]
  // };

  Map<String, List<Map<String, String>>> myEvents = {};

  Future getAllKalender() async {
    try {
      var response = await _kalenderProvider.getkalender();
      //       someMethod(){
      //   someMap.addAll({
      //     'email' : 'test@gmail.com'
      //   });
      // }

      for (int i = 0; i < response.length; i++) {
        String date = response[i].date.toString().substring(0, 9);
        myEvents.addAll({
          date: [
            {
              'eventDescp': response[i].name,
              'eventTitle': response[i].category,
            },
          ],
        });
      }

      print(myEvents);
      change(myEvents, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  List listOfDayEvents(DateTime dateTime) {
    if (myEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return myEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  CalendarFormat calendarFormat = CalendarFormat.month;
  RangeSelectionMode rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  // Map<String, List>? mySelectedEvents = {};
  DateTime? selectedDate;

  // @override
  // void initState() {
  //   super.initState();

  //   _selectedDay = _focusedDay;
  //   // _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));

  // mySelectedEvents = {
  //   "2022-12-1": [
  //     {"eventDescp": "11", "eventTitle": "111"},
  //     {"eventDescp": "11", "eventTitle": "111"},
  //   ],
  //   "2022-12-12": [
  //     {"eventDescp": "22", "eventTitle": "22"}
  //   ],
  //   "2022-12-08981": [
  //     {"eventTitle": "ss", "eventDescp": "ss"}
  //   ]
  // };
  // }

  // @override
  // void dispose() {
  //   _selectedEvents.dispose();
  //   super.dispose();
  // }

  @override
  void onInit() {
    super.onInit();
    selectedDay = focusedDay;

    getAllKalender();
  }
}





// import 'dart:collection';

// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:kampus_gratis/models/Kalender/Kalender_model.dart';
// import 'package:kampus_gratis/services/providers/kalender/Kalender_provider.dart';
// import 'package:table_calendar/table_calendar.dart';

// class KalenderController extends GetxController
//     with StateMixin<List<KalenderModel>> {
//   // final kalenderProvider _kalenderProvider;
//   // KalenderController(this._kalenderProvider);
//   late final ValueNotifier<List<KalenderModel>> selectedEvents;
//   CalendarFormat calendarFormat = CalendarFormat.month;
//   RangeSelectionMode rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime focusedDay = DateTime.now();
//   DateTime? selectedDay;
//   DateTime? rangeStart;
//   DateTime? rangeEnd;

//   final kEvents = LinkedHashMap<DateTime, List<KalenderModel>>(
//     equals: isSameDay,
//     hashCode: getHashCode,
//   )..addAll(kEventSource);

//   List<Event> getEventsForDay(DateTime day) {
//     return kEvents[day] ?? [];
//   }

//   int getHashCode(DateTime key) {
//     return key.day * 1000000 + key.month * 10000 + key.year;
//   }

//   void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(selectedDay, selectedDay)) {
//       selectedDay = selectedDay;
//       focusedDay = focusedDay;
//       rangeStart = null; // Important to clean those
//       rangeEnd = null;
//       rangeSelectionMode = RangeSelectionMode.toggledOff;

//       selectedEvents.value = getEventsForDay(selectedDay);
//     }
//   }

//   void onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     selectedDay = null;
//     focusedDay = focusedDay;
//     rangeStart = start;
//     rangeEnd = end;
//     rangeSelectionMode = RangeSelectionMode.toggledOn;

//     List<KalenderModel> getEventsForRange(DateTime start, DateTime end) {
//       final days = daysInRange(start, end);

//       return [
//         for (final d in days) ...getEventsForDay(d),
//       ];
//     }

//     // `start` or `end` could be null
//     if (start != null && end != null) {
//       selectedEvents.value = getEventsForRange(start, end);
//     } else if (start != null) {
//       selectedEvents.value = getEventsForDay(start);
//     } else if (end != null) {
//       selectedEvents.value = getEventsForDay(end);
//     }
//   }

//   // Future getkalender() async {
//   //   try {
//   //     final kalender = await _kalenderProvider.getkalender();
//   //     change(kalender, status: RxStatus.success());
//   //   } catch (e) {
//   //     change(null, status: RxStatus.error(e.toString()));
//   //   }
//   // }

//   @override
//   void onInit() {
//     // getkalender();

//     selectedDay = focusedDay;
//     selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     selectedEvents.dispose();
//     super.onClose();
//   }
// }

// // Copyright 2019 Aleksander Woźniak
// // SPDX-License-Identifier: Apache-2.0

// /// Example event class.
// class Event {
//   final String title;

//   const Event(this.title);

//   @override
//   String toString() => title;
// }

// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// )..addAll(_kEventSource);

// final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
//     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
//     value: (item) => List.generate(
//         item % 4 + 1, (index) => Event('Acara Mknows $item | ${index + 1}')))
//   ..addAll({
//     kToday: [
//       Event('Today\'s Event 1'),
//       Event('Today\'s Event 3'),
//     ],
//   });

// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// List<DateTime> daysInRange(DateTime first, DateTime last) {
//   final dayCount = last.difference(first).inDays + 1;
//   return List.generate(
//     dayCount,
//     (index) => DateTime.utc(first.year, first.month, first.day + index),
//   );
// }

// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
