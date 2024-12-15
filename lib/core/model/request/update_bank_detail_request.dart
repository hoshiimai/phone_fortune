class UpdateBankDetailRequest {
  final String? bankCode;
  final String? branchName;
  final String? branchCode;
  final String? accountNumber;
  final String? firstName;
  final String? lastName;

  UpdateBankDetailRequest({
    this.bankCode,
    this.branchName,
    this.branchCode,
    this.accountNumber,
    this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {
      'bankCode': bankCode,
      'branchName': branchName,
      'branchCode': branchCode,
      'number': accountNumber,
      'firstname': firstName,
      'lastname': lastName,
    };
  }
}