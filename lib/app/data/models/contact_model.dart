class ContactModel {
  final int? id;
  final String name;
  final String phoneNumber;
  final String email;
  final String company;
  final String? image;

  ContactModel({
    this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.company,
    required this.image,
  });

  ContactModel copyWith({
    int? id,
    String? name,
    String? phoneNumber,
    String? email,
    String? company,
    String? image,
  }) {
    return ContactModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      company: company ?? this.company,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'company': company,
      'image': image,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      company: map['company'],
      image: map['image'],
    );
  }
}
