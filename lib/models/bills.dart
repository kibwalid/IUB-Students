class Bill {
  double balance;
  String billType;
  String regSem;
  String regYear;
  String dueDate;
  String regCode;

  Bill({
    required this.balance,
    required this.billType,
    required this.regSem,
    required this.regYear,
    required this.dueDate,
    required this.regCode,
  });

  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
        balance: json['balance'].toDouble(),
        billType: json['billType'],
        regSem: json['regSem'],
        regYear: json['regYear'],
        dueDate: json['dueDate'],
        regCode: json['regCode']);
  }

  Map<String, dynamic> toJson() {
    return {
      'balance': balance,
      'billType': billType,
      'regSem': regSem,
      'regYear': regYear,
      'dueDate': dueDate,
      'regCode': regCode
    };
  }

  String toJsonString() {
    return """{
      'balance': $balance,
      'billType': '$billType',
      'regSem': '$regSem',
      'regYear': '$regYear',
      'dueDate': '$dueDate',
      'regCode': '$regCode'
    }"""
        .replaceAll("'", "\"");
  }
}
