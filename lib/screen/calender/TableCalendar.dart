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
  CalendarController controller = Get.put(CalendarController());
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
    return controller.listRequestForDay(day);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Calendar'),
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
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: (selectedDay, focusedDay) async {
              // _selectedDay;
              _focusedDay = focusedDay;
              _selectedDay = selectedDay;
              focusedDay = selectedDay;
              controller.filter(selectedDay);
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
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                              bottom:
                              BorderSide(width: 1.0, color: AppColors.border),
                            ),
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
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
