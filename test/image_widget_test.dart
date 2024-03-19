import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:photo_proj/features/daily_news/presentation/pages/daily_news.dart';
import 'package:photo_proj/features/daily_news/presentation/pages/image_in_detail.dart';

main() {

  testWidgets('Network image testing...', (WidgetTester tester) async {

      await tester.pumpWidget(const DailyNews());
      expect(find.byKey(const Key('networkImg')), findsOneWidget);
    },
  );

}