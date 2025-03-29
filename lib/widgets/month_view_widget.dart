import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../pages/event_details_page.dart';
import '../pages/day_view_page.dart'; // Импортируем DayViewPageDemo

class MonthViewWidget extends StatelessWidget {
  final GlobalKey<MonthViewState>? state;
  final double? width;

  const MonthViewWidget({
    super.key,
    this.state,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MonthView(
      key: state,
      width: width,
      showWeekends: true,
      startDay: WeekDays.friday,
      useAvailableVerticalSpace: true,
      onCellTap: (date, events) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DayViewPageDemo(),
          ),
        );
      },
      onEventTap: (event, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: event,
              date: date,
            ),
          ),
        );
      },
      onEventLongTap: (event, date) {
        SnackBar snackBar = SnackBar(content: Text("on LongTap"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
