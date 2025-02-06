class UserModel {
  final String userID;
  final String name;
  final String email;
  final String role;
  final String sellerStatus;
  final String mobileNumber;
  final String address;
  final String profession;
  final String dateOfBirth;
  final String profileImageUrl;

  UserModel( {
    required this.userID,
    required this.name,
    required this.email,
    required this.role,
    required this.sellerStatus,
    required this.mobileNumber,
    required this.address,
    required this.profileImageUrl,
    required this.profession,
    required this.dateOfBirth,
  });

  // Convert User object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'name': name,
      'email': email,
      'role': role,
      'sellerStatus': sellerStatus,
      'mobileNumber': mobileNumber,
      'address': address,
      'profileImageUrl': profileImageUrl,
      'profession': profession,
      'dot':dateOfBirth,
    };
  }

  // Create User object from Firestore document
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userID: map['userID'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      sellerStatus: map['sellerStatus'] ?? '',
      mobileNumber: map['mobileNumber'] ?? '',
      address: map['address'] ?? '',
      profileImageUrl: map['profileImageUrl'] ?? '',
      profession: map['profession'],
      dateOfBirth: map['dot'],
    );
  }
}
