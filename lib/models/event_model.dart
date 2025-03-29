import 'package:flutter/material.dart';
import 'dart:convert';

class Event {
  final DateTime date;
  final String startTime;
  final String endTime;
  final String title;
  final String description;
  final String recurrence;
  final List<String> days;

  Event({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.description,
    required this.recurrence,
    required this.days,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: DateTime.parse(json["date"]),
      startTime: json["startTime"],
      endTime: json["endTime"],
      title: json["title"],
      description: json["description"] ?? "",
      recurrence: json["recurrence"] ?? "none",
      days: List<String>.from(json["days"] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "date": date.toIso8601String(),
      "startTime": startTime,
      "endTime": endTime,
      "title": title,
      "description": description,
      "recurrence": recurrence,
      "days": days,
    };
  }
}

class CalendarChatScreen extends StatefulWidget {
  @override
  _CalendarChatScreenState createState() => _CalendarChatScreenState();
}

class _CalendarChatScreenState extends State<CalendarChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Event> _events = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Календарь")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                final event = _events[index];
                return ListTile(
                  title: Text("${event.title} - ${event.startTime} до ${event.endTime}"),
                  subtitle: Text("Дата: ${event.date.toLocal()}"),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Введите запрос (например, завтра в 3 дня тренировка)",
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _controller.text;
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
