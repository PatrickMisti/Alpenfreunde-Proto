
class Appointment {
  late int id;
  String title;
  String description;
  DateTime date;

  Appointment({this.id = 0,required this.title,required this.description, required this.date});

  Appointment init(Appointment appointment) {
    return Appointment(id: appointment.id,title: title, description: description, date: date);
  }

  bool isEqual(Appointment appointment){
    return title.compareTo(appointment.title) == 0 &&
        description.compareTo(description) == 0 &&
        date.compareTo(appointment.date) == 0;
  }
}