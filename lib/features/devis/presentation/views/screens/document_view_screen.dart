import 'dart:async';
import 'dart:io';

import 'package:egote_services_v2/features/common/presentation/extensions/extensions.dart';
import 'package:egote_services_v2/features/devis/presentation/views/screens/generator_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../states/entities/data/data.dart';

class DocumentViewScreen extends ConsumerStatefulWidget {
  const DocumentViewScreen({super.key});

  @override
  ConsumerState createState() => _DevisViewScreenState();
}

class _DevisViewScreenState extends ConsumerState<DocumentViewScreen>
    with SingleTickerProviderStateMixin {
  int _tab = 0;
  TabController? _tabController;
  PrintingInfo? printingInfo;

  @override
  void initState() {
    super.initState();
    _initPrinting();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  Future<void> _initPrinting() async {
    final info = await Printing.info();

    _tabController =
        TabController(length: examples.length, vsync: this, initialIndex: _tab);

    _tabController!.addListener(() {
      if (_tab != _tabController!.index) {
        setState(() {
          _tab = _tabController!.index;
        });
      }
    });

    setState(() {
      printingInfo = info;
    });
  }

  void _showPrintedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document successfully Printed!'),
      ),
    );
  }

  void _showSharedToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Document successfully Shared!'),
      ),
    );
  }

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat format,
  ) async {
    final bytes = await build(format);

    final appDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDir.path;
    final file = File('$appDocPath/document.pdf');
    if (kDebugMode) {
      print('Save as file ${file.path} ...');
    }
    await file.writeAsBytes(bytes);
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => file.readAsBytes(),
    );
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    pw.RichText.debug = true;

    if (_tabController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final data = ref.read(dataProvider);
    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Devis'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: examples.map<Tab>((e) => Tab(text: e.name)).toList(),
        ),
      ),
      body: PdfPreview(
        maxPageWidth: context.screenSize.width,
        allowSharing: true,
        actions: actions,
        build: (format) => examples[_tab].builder(format, data),
        onPrinted: _showPrintedToast,
        onShared: _showSharedToast,
      ),
    );
  }
}

final dataProvider = Provider<CustomData>((ref) {
  final name = 'Ahmed';
  final bool testing = true;

  return CustomData(name: name, testing: testing);
});
