class ResendCodeRequest {
  final String email;

  ResendCodeRequest({required this.email});

  factory ResendCodeRequest.fromJson(Map<String, dynamic> json) {
    return ResendCodeRequest(
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}