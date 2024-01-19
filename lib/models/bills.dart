class Bill {
  double balance;
  String billType;
  String regSem;
  String regYear;
  String dueDate;

  Bill({
    required this.balance,
    required this.billType,
    required this.regSem,
    required this.regYear,
    required this.dueDate,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      balance: json['balance'].toDouble(),
      billType: json['billType'],
      regSem: json['regSem'],
      regYear: json['regYear'],
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'billType': billType,
      'regSem': regSem,
      'regYear': regYear,
      'dueDate': dueDate
    };
  }

  String toJsonString() {
    return """{
      'balance': $balance,
      'billType': '$billType',
      'regSem': '$regSem',
      'regYear': '$regYear',
      'dueDate': '$dueDate'
    }"""
        .replaceAll("'", "\"");
  }
}
