import 'package:day_offf_app/screen/calender/untils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';
import '../../widget/custom_text.dart';
import 'controller/CalendarController.dart';

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    CalendarController controller = Get.put(CalendarController());
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: (selectedDay, focusedDay) async{
              // _selectedDay;
              print(selectedDay.toString());
                focusedDay=await selectedDay;
              controller.filter(selectedDay);
            },
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Obx(() => Expanded(
            child: ListView.builder(
                  itemCount: controller.listRequestDay.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(AppUrl.avatar_url),
                        ),
                        title: CustomText(
                          text:
                              '${controller.listRequestDay[index].user!.nickName}',
                          size: 20,
                          color: AppColors.black,
                          weight: FontWeight.bold,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                ),
                                CustomText(
                                  text: controller.listRequestDay[index].fromDay
                                      .toString()
                                      .substring(0, 10),
                                  size: 15,
                                  color: AppColors.doveGray,
                                  weight: FontWeight.w500,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 15,
                                ),
                                CustomText(
                                  text: controller.listRequestDay[index].toDay
                                      .toString()
                                      .substring(0, 10),
                                  size: 15,
                                  color: AppColors.doveGray,
                                  weight: FontWeight.w500,
                                )
                              ],
                            ),
                            CustomText(
                              text:
                                  'Reason : ${controller.listRequestDay[index].reason}',
                              size: 15,
                              color: AppColors.amaranth,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.amaranth,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: CustomText(
                                text:
                                    '  ${controller.listRequestDay[index].state}  ',
                                size: 15,
                                color: AppColors.white,
                                weight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
          ))
          // Expanded(
          //   child: ValueListenableBuilder<List<Event>>(
          //     valueListenable: _selectedEvents,
          //     builder: (context, value, _) {
          //       return ListView.builder(
          //         itemCount: value.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             margin: const EdgeInsets.symmetric(
          //               horizontal: 12.0,
          //               vertical: 4.0,
          //             ),
          //             decoration: BoxDecoration(
          //               border: Border.all(),
          //               borderRadius: BorderRadius.circular(12.0),
          //             ),
          //            child: ListTile(
          //               leading: const CircleAvatar(
          //                 radius: 30,
          //                 backgroundImage: NetworkImage(AppUrl.avatar_url),
          //               ),
          //               title: CustomText(
          //                 text:
          //                 '${allRequestController.listRequest[index].user!.nickName}',
          //                 size: 20,
          //                 color: AppColors.black,
          //                 weight: FontWeight.bold,
          //               ),
          //               subtitle: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Row(
          //                     children: [
          //                       const Icon(
          //                         Icons.calendar_today_outlined,
          //                         size: 15,
          //                       ),
          //                       CustomText(
          //                         text:
          //                         allRequestController.listRequest[index].fromDay.toString().substring(0,10),
          //                         size: 15,
          //                         color: AppColors.doveGray,
          //                         weight: FontWeight.w500,
          //                       )
          //                     ],
          //                   ),
          //                   Row(
          //                     children: [
          //                       const Icon(
          //                         Icons.calendar_today_outlined,
          //                         size: 15,
          //                       ),
          //                       CustomText(
          //                         text:
          //                         allRequestController.listRequest[index].toDay.toString().substring(0,10),
          //                         size: 15,
          //                         color: AppColors.doveGray,
          //                         weight: FontWeight.w500,
          //                       )
          //                     ],
          //                   ),
          //                   CustomText(
          //                     text:
          //                     'Reason : ${allRequestController.listRequest[index].reason}',
          //                     size: 15,
          //                     color: AppColors.amaranth,
          //                     weight: FontWeight.w500,
          //                   ),
          //                 ],
          //               ),
          //               isThreeLine: true,
          //               trailing: Column(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   Container(
          //                     decoration: const BoxDecoration(
          //                         color: AppColors.amaranth,
          //                         borderRadius:
          //                         BorderRadius.all(Radius.circular(8))),
          //                     child: CustomText(
          //                       text:
          //                       '  ${allRequestController.listRequest[index].state}  ',
          //                       size: 15,
          //                       color: AppColors.white,
          //                       weight: FontWeight.w500,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
