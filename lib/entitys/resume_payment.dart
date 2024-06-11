class ResumePaiment {
  String name;
  String address;
  String location;
  String cardNumber;
  double subtotal = 0.0;
  double total = 0.0;

  ResumePaiment(
      {required this.name,
      required this.address,
      required this.location,
      required this.cardNumber,
      required this.subtotal,
      required this.total});

  factory ResumePaiment.fromJson(Map<String, dynamic> json) {
    return ResumePaiment(
        name: json['name'] ?? '',
        address: json['address'] ?? '',
        location: json['location'] ?? '',
        cardNumber: json['cardNumber'] ?? '',
        subtotal: json['subtotal'] ?? 0,
        total: json['total'] ?? 0);
  }
}
