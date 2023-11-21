
import 'package:alpinfreunde_front/models/appointment.dart';

abstract class IAppointmentService {
  List<Appointment> getAllAppointments();

  Appointment getAppointment(int id);

  bool saveAppointment(Appointment appointment);
}