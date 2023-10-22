import 'package:flutter_test/flutter_test.dart';
import 'package:loyalyet_app/modules/site/site.dart';
import 'package:loyalyet_app/modules/site_api/thecoffeehouse.com/v5/tch_v5_api.dart';
import 'package:loyalyet_app/modules/storage/storage.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('TheCoffeeHouseV5', () {
    final tch = TheCoffeeHouseV5(
      siteId: SiteId.theCoffeeHouse,
      storage: _MockedStorage(),
      userId: '',
    );

    group('encryptOtp', () {
      test('returns encrypted string 1', () {
        final actual = tch.encryptOtp('627386');
        expect(actual, equals('8ebb7523984c7ad688b6f54fa3c03c1c'));
      });

      test('returns encrypted string 2', () {
        final actual = tch.encryptOtp('899411');
        expect(actual, equals('2bd039b1e3363f998e5050c1ff9cb589'));
      });

      test('returns encrypted string 3', () {
        final actual = tch.encryptOtp('021388');
        expect(actual, equals('fc117438e8b35839b8e1b3ef8c846a3c'));
      });
    });
  });
}

class _MockedStorage extends Mock implements StorageRepositoryFactory {}
