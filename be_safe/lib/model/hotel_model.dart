class HotelModel {
  final String hotelId;
  final String name;
  final String location;
  final String description;
  final String price;
  final String discount;
  final String priceInfo;
  final int totalRooms;
  final int bookedRooms;
  final String hotelCategory;
  final bool breakfastAvailable;
  final bool payLater;
  final List<String> keyFeatures;
  final List<String> imageUrl;
  final double rating;
  final int reviews;
  final bool vipStatus;
  final String localBookingOfferPercentage;
  final bool isRegistered;

  HotelModel({
    required this.hotelId,
    required this.location,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.price,
    required this.priceInfo,
    required this.discount,
    required this.vipStatus,
    required this.localBookingOfferPercentage,
    required this.payLater,
    required this.hotelCategory,
    required this.totalRooms,
    required this.bookedRooms,
    required this.isRegistered,
    required this.keyFeatures,
    required this.breakfastAvailable,
  });

  // Converts a HotelModel instance to a map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'hotelId': hotelId,
      'location': location,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'rating': rating,
      'reviews': reviews,
      'price': price,
      'priceInfo': priceInfo,
      'discount': discount,
      'vipStatus': vipStatus,
      'offerPercentage': localBookingOfferPercentage,
      'payLater': payLater,
      'hotelCategory': hotelCategory,
      'totalRooms': totalRooms,
      'bookedRooms': bookedRooms,
      'isRegistered': isRegistered,
      'keyFeatures': keyFeatures,
      'breakfastAvailable': breakfastAvailable,
    };
  }

  // Creates a HotelModel instance from a map (useful for Firestore data fetching)
  factory HotelModel.fromMap(Map<String, dynamic> map) {
    return HotelModel(
      hotelId: map['hotelId'],
      location: map['location'],
      name: map['name'],
      description: map['description'],
      imageUrl: List<String>.from(map['imageUrl']),
      rating: map['rating'],
      reviews: map['reviews'],
      price: map['price'],
      priceInfo: map['priceInfo'],
      discount: map['discount'],
      vipStatus: map['vipStatus'],
      localBookingOfferPercentage: map['offerPercentage'],
      payLater: map['payLater'],
      hotelCategory: map['hotelCategory'],
      totalRooms: map['totalRooms'],
      bookedRooms: map['bookedRooms'],
      isRegistered: map['isRegistered'],
      keyFeatures: List<String>.from(map['keyFeatures']),
      breakfastAvailable: map['breakfastAvailable'],
    );
  }
}
