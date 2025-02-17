import 'package:flutter/material.dart';

import '../enumerations.dart';
import '../extension.dart';
import '../widgets/month_view_widget.dart';
import '../widgets/responsive_widget.dart';
import 'create_event_page.dart';
import 'web/web_home_page.dart';

class MonthViewPageDemo extends StatefulWidget {
  const MonthViewPageDemo({
    super.key,
  });

  @override
  _MonthViewPageDemoState createState() => _MonthViewPageDemoState();
}

class _MonthViewPageDemoState extends State<MonthViewPageDemo> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      webWidget: WebHomePage(
        selectedView: CalendarView.month,
      ),
      mobileWidget: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.add),
              elevation: 8,
              onPressed: () => context.pushRoute(CreateEventPage()),
            ),
            SizedBox(height: 16),
          ],
        ),
        body: MonthViewWidget(),
      ),
    );
  }
}
