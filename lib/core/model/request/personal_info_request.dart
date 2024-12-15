class PersonalInfoRequest {
  final String? fullName;
  final String? kataName;
  final String? birthDate;
  final String? phoneNumber;

  PersonalInfoRequest({
    this.fullName,
    this.kataName,
    this.birthDate,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': fullName,
      'nameKata': kataName,
      'birth': birthDate,
      'tel': phoneNumber,
    };
  }
}
