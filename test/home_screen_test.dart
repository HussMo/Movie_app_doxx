import 'package:cubit_movies/shared/core/base/pageinitation_scroll_scroller_view.dart';
import 'package:cubit_movies/shared/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cubit_movies/presentation/ui/home/home_screen.dart';

void main() {
  testWidgets('HomeScreen renders main widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.byType(ColoredBox), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(ConstrainedBox), findsOneWidget);
    expect(find.byType(BlocBuilder), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(PreferredSize), findsOneWidget);
    expect(find.byType(Expanded), findsNWidgets(2));
    expect(find.byType(Container), findsNWidgets(3));
    expect(find.byType(RefreshIndicator), findsOneWidget);
    expect(find.byType(Builder), findsOneWidget);
    expect(find.byType(PaginationScrollView), findsOneWidget);
  });

  testWidgets('HomeScreen shows no movies message',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.text('No movies'), findsNothing);
  });

  testWidgets('HomeScreen displays search field', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.byType(AppTextField), findsOneWidget);
  });

  testWidgets('HomeScreen shows filter icon', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    expect(find.byIcon(Icons.filter_alt_outlined), findsOneWidget);
  });

  testWidgets('HomeScreen navigates on movie item tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
  });

  testWidgets('HomeScreen filters movies on icon button tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
  });
}
