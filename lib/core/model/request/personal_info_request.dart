class PersonalInfoRequest {
  final String? name;
  final String? kataName;
  final String? birthDate;
  final String? phoneNumber;

  PersonalInfoRequest({
    this.name,
    this.kataName,
    this.birthDate,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': name,
      'nameKata': kataName,
      'birth': birthDate,
      'tel': phoneNumber,
    };
  }
}
