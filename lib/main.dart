import 'package:flutter/material.dart';
import 'package:generative_ui/a2ui_test.dart';
import 'package:generative_ui/user_item_catalog.dart';
import 'package:genui/genui.dart';

void main() {
  runApp(const GenUiPracticeApp());
}

class GenUiPracticeApp extends StatelessWidget {
  const GenUiPracticeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GenUI Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const GenUiPracticePage(),
    );
  }
}

class GenUiPracticePage extends StatefulWidget {
  const GenUiPracticePage({super.key});

  @override
  State<GenUiPracticePage> createState() =>
      _GenUiPracticePageState();
}

class _GenUiPracticePageState
    extends State<GenUiPracticePage> {
  late final SurfaceController _surfaceController;

  @override
  void initState() {
    super.initState();

    // GenUI's built-in catalog.
    final catalog = BasicCatalogItems.asCatalog().copyWith(
      newItems: [
        userItem
      ]
    );

    // Create the GenUI runtime controller.
    _surfaceController = SurfaceController(
      catalogs: [catalog],
    );


    _surfaceController.onSubmit.listen((message) {
      debugPrint('UI action received: $message');
    });

    // Send our hard-coded A2UI messages.
    for (final message in userListMessages) {
      _surfaceController.handleMessage(message);
    }

    debugPrint(
      'Active surfaces: '
          '${_surfaceController.activeSurfaceIds.toList()}',
    );
  }

  @override
  void dispose() {
    _surfaceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GenUI Practice'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Surface(
          surfaceContext: _surfaceController.contextFor('main'),
        ),
      ),
    );
  }
}