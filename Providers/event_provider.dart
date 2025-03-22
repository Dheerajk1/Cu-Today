import 'package:flutter/material.dart';
import '../models/event_model.dart'; // Ensure this path is correct

class EventProvider with ChangeNotifier {
  List<EventModel> _events = [];

  List<EventModel> get events => _events;

  void addEvent(EventModel event) {
    _events.add(event);
    notifyListeners();
  }
}
