class UserModel {
  late List<CountryPhonesModel> groupCountryPhones;

  UserModel({
    required this.groupCountryPhones,
  });

  static UserModel emptyModel() => UserModel(
        groupCountryPhones: [],
      );
}

class CountryPhonesModel {
  late String nameCountry;
  late List<PhonesModel> groupPhoneNumber;

  CountryPhonesModel({
    required this.nameCountry,
    required this.groupPhoneNumber,
  });
}

class PhonesModel {
  late String phoneNumber;
  late String sity;
  late String typePhone;

  PhonesModel({
    required this.phoneNumber,
    required this.sity,
    required this.typePhone,
  });
}
