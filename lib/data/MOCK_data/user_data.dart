import 'package:test_project_flutter/data/models/user_model.dart';

final UserModel user = UserModel(
  groupCountryPhones: [
    CountryPhonesModel(
      nameCountry: 'United States',
      groupPhoneNumber: [
        PhonesModel(
          phoneNumber: '+12011234567',
          sity: 'New Jersey',
          typePhone: 'Landline',
        ),
        PhonesModel(
          phoneNumber: '+12011234567',
          sity: 'New Jersey',
          typePhone: 'Mobile',
        ),
        PhonesModel(
          phoneNumber: '+12011234567',
          sity: 'New Jersey',
          typePhone: 'Landline',
        ),
      ],
    ),
    CountryPhonesModel(
      nameCountry: 'United Kingdom',
      groupPhoneNumber: [
        PhonesModel(
          phoneNumber: '+12011234567',
          sity: 'New Jersey',
          typePhone: 'Landline',
        ),
        PhonesModel(
          phoneNumber: '+12011234567',
          sity: 'New Jersey',
          typePhone: 'Mobile',
        ),
        PhonesModel(
          phoneNumber: '+12011234567',
          sity: 'New Jersey',
          typePhone: 'Landline',
        ),
      ],
    ),
  ],
);
