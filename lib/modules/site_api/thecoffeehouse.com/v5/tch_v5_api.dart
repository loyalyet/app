import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:loyalyet_app/modules/site_api/site_api.dart';
import 'package:loyalyet_app/modules/site_api/thecoffeehouse.com/tch_credentials_data.dart';
import 'package:loyalyet_app/modules/site_api/thecoffeehouse.com/tch_site_data.dart';

class TheCoffeeHouseV5
    extends SiteApi<TheCoffeeHouseCredentialsData, TheCoffeeHouseSiteData> {
  TheCoffeeHouseV5({
    required super.siteId,
    required super.storage,
    required super.userId,
  }) : super(
          version: 5,
          unmarshaler: TheCoffeeHouseCredentialsData.fromJson,
        );

  @visibleForTesting
  String encryptOtp(String otp) {
    // this method is reversed engineered from the app
    // Lcom/thecoffeehouse/guestapp/screens/login/LoginViewModel$encryptedOTP$hashedOTPString$1;
    final hashed = md5.convert(utf8.encode(otp)).toString();
    final [...units, last] = hashed.codeUnits.reversed.toList(growable: false);
    final shuffled = [last, ...units];
    return shuffled.map(String.fromCharCode).join();
  }
}
