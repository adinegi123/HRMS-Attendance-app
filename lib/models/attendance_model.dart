import 'package:equatable/equatable.dart';

class Attendance extends Equatable {
  final String userID;
  final DateTime date;
  final DateTime clockInTime;
  final DateTime clockOutTime;
  final double workingHours;
  final String status;
  final String location;
  final String notes;

  const Attendance({
    required this.userID,
    required this.date,
    required this.clockInTime,
    required this.clockOutTime,
    required this.workingHours,
    required this.status,
    required this.location,
    required this.notes,
  });

  @override
  List<Object?> get props => [
        userID,
        date,
        clockInTime,
        clockOutTime,
        workingHours,
        status,
        location,
        notes,
      ];
}
