

class Doctor {
  final String name;
  final String expertise;
  final String visitDate;
  final String description;
  final String doctorProfileImage;

  Doctor({required this.name, required this.expertise, required this.description, required this.visitDate, required this.doctorProfileImage});



  factory Doctor.fromJson(Map<String, dynamic> map) {
    return Doctor(
      name: map['name'] ?? '',
      expertise: map['expertise'] ?? '',
      visitDate: map['visitDate'] ?? '',
      description: map['description'] ?? '',
      doctorProfileImage: map['doctorProfileImage'] ?? '',
    );
  }
}
