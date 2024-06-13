class Payment {
  String token;
  String idOrder;
  String cardNumber;
  String accountHolder;
  String cardExpiration;
  String securityCode;
  int paymentInstallments;
  int idMethod;
  double totalPaid;
  Payment(
      {required this.token,
      required this.idOrder,
      required this.cardNumber,
      required this.accountHolder,
      required this.cardExpiration,
      required this.securityCode,
      required this.paymentInstallments,
      required this.idMethod,
      required this.totalPaid});
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      token: json['token'] ?? '',
      idOrder: json['idOrder'] ?? '',
      cardNumber: json['cardNumber'] ?? '',
      accountHolder: json['accountHolder'] ?? '',
      cardExpiration: json['cardExpiration'] ?? '',
      securityCode: json['securityCode'] ?? '',
      paymentInstallments: json['paymentInstallments'] ?? 0,
      idMethod: json['idMethod'] ?? 0,
      totalPaid: json['totalPaid'] ?? 0.0,
    );
  }
}
