import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog/main.dart';

void main() {
  testWidgets('Discover screen loads product grid', (WidgetTester tester) async {
    await tester.pumpWidget(const MiniKatalogApp());

    // Discover ekranının başlığı görünüyor mu kontrol eder
    expect(find.text('Discover'), findsOneWidget);
  });
}