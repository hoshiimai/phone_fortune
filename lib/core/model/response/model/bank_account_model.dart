class BankAccountModel {
  final int id;
  final int userId;
  final String? holderName;
  final String? bankName;
  final String? branchCode;
  final String? number;

  BankAccountModel({
    required this.id,
    required this.userId,
    this.holderName,
    this.bankName,
    this.branchCode,
    this.number,
  });

  // Factory method to create a BankAccountModel from JSON
  factory BankAccountModel.fromJson(Map<String, dynamic> json) {
    return BankAccountModel(
      id: json['id'],
      userId: json['user_id'],
      number: json['number'],
      holderName: json['account_holder_name'],
      bankName: json['branch_name'],
      branchCode: json['branch_code'],
    );
  }

  // Optionally, you can also add a toJson method
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'account_holder_name': holderName,
      'branch_name': bankName,
      'branch_code': branchCode,
      'number': number,
    };
  }
}
