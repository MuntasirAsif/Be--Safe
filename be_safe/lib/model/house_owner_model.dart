class HouseOwnerModel {
  final String ownerName;
  final String phoneNumber;
  final String address;
  final String nidNumber;
  final List<String> ownerDocImageUrl;
  final String hotelId;

  HouseOwnerModel({
    required this.ownerName,
    required this.phoneNumber,
    required this.nidNumber,
    required this.ownerDocImageUrl,
    required this.hotelId,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'ownerName': ownerName,
      'phoneNumber': phoneNumber,
      'address': address,
      'nidNumber': nidNumber,
      'ownerDocImageUrl': ownerDocImageUrl,
      'hotelId': hotelId,
    };
  }

  factory HouseOwnerModel.fromJson(Map<String, dynamic> json) {
    return HouseOwnerModel(
      ownerName: json['ownerName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      nidNumber: json['nidNumber'],
      ownerDocImageUrl: List<String>.from(json['ownerDocImageUrl']),
      hotelId: json['hotelId'],
    );
  }
}
