class AuthResponse {
  dynamic id;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? phone;
  dynamic gender;
  dynamic address;
  String? apiToken;
  dynamic role;
  dynamic dob;
  dynamic profileImg;
  dynamic coverImg;
  dynamic provider;
  dynamic uid;
  dynamic language;
  String? notification;
  dynamic walletCoin;

  AuthResponse(
      {this.id,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastName,
      this.phone,
      this.gender,
      this.address,
      this.apiToken,
      this.role,
      this.dob,
      this.profileImg,
      this.coverImg,
      this.provider,
      this.uid,
      this.language,
      this.notification,
      this.walletCoin});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    gender = json['gender'];
    address = json['address'];
    apiToken = json['api_token'];
    role = json['role'];
    dob = json['dob'];
    profileImg = json['profile_img'];
    coverImg = json['cover_img'];
    provider = json['provider'];
    uid = json['uid'];
    language = json['language'];
    notification = json['notification'];
    walletCoin = json['wallet_coin'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'gender': gender,
      'address': address,
      'api_token': apiToken,
      'role': role,
      'dob': dob,
      'profile_img': profileImg,
      'cover_img': coverImg,
      'provider': provider,
      'uid': uid,
      'language': language,
      'notification': notification,
      'wallet_coin': walletCoin
    };
  }
}
