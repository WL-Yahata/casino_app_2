import 'package:casino_app_2/view/owners%20view/owners%20Schedule/listTournamentPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class OwnersSchedulePage extends StatefulWidget {
  const OwnersSchedulePage({Key? key}) : super(key: key);

  @override
  State<OwnersSchedulePage> createState() => _OwnersSchedulePageState();
}

class _OwnersSchedulePageState extends State<OwnersSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'schedule',
            style: TextStyle(color: Colors.black54),
          ),
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 1,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListTournamentPage()));
          },
          backgroundColor: Colors.black45,
          child: const Icon(Icons.list),
        ),
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              showAgenda: true,
              showTrailingAndLeadingDates: false,
            ),
            dataSource: _getCalendarDataSource(),
          ),
        ),
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];

    appointments.add(Appointment(
        startTime: DateTime(2022, 7, 4, 16),
        endTime: DateTime(2022, 7, 4, 18),
        subject: 'Monday 16:00~',
        color: Colors.blue.shade200,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=70'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 7, 4, 18),
        endTime: DateTime(2022, 7, 4, 20),
        subject: 'Monday 18:00~',
        color: Colors.blue,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=70'));
    appointments.add(Appointment(
        startTime: DateTime(2022, 7, 4, 20),
        endTime: DateTime(2022, 7, 4, 22),
        subject: 'Monday 20:00~',
        color: Colors.blue.shade300,
        recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=70'));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
