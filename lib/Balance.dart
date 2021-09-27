class Balance {
  int id;
  String name;
  String email;
  String phone;
  int balance;

  Balance({required this.id, required this.name, required this.email, required this.phone, required this.balance});

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      balance: json['Wallet'] as int
    );
  }
}