import 'dart:typed_data';

import 'package:pdf/pdf.dart';

import '../../states/entities/data/data.dart';
import 'devis_view_model_screen.dart';

const examples = <Example>[
  Example('DEVIS 1', 'devis_view_model_screen.dart', generateDevisPdf),
  Example('DEVIS 2', 'devis_view_model_screen.dart', generateDevisPdf),
];

typedef LayoutCallbackWithData = Future<Uint8List> Function(
    PdfPageFormat pageFormat, CustomData data);

class Example {
  const Example(this.name, this.file, this.builder, [this.needsData = false]);

  final String name;

  final String file;

  final LayoutCallbackWithData builder;

  final bool needsData;
}
