import 'package:flutter_test/flutter_test.dart';
import 'package:loyalyet_app/app/app.dart';
import 'package:loyalyet_app/modules/site/site.dart';

void main() {
  group('App', () {
    testWidgets('renders SiteListPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SiteListPage), findsOneWidget);
    });
  });
}
