import 'dart:typed_data';

import 'package:intl/intl.dart' as intl;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../../config/app_shared/images/list_local.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../domain/entities/products/produit_model_entity.dart';
import '../../states/entities/data/data.dart';

Future<Uint8List> generateDevisPdf(
    PdfPageFormat format, CustomData data) async {
  final lorem = pw.LoremText();

  final products = <Produit>[
    Produit(
        sku: '19874',
        produitName: 'bitinla',
        description: lorem.sentence(4),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 3.99,
        quantity: 2),
    Produit(
        sku: '98452',
        produitName: 'bitinla',
        description: lorem.sentence(6),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 15,
        quantity: 2),
    Produit(
        sku: '28375',
        produitName: 'bitinla',
        description: lorem.sentence(4),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 6.95,
        quantity: 3),
    Produit(
        sku: '95673',
        produitName: 'bitinla',
        description: lorem.sentence(3),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 49.99,
        quantity: 4),
    Produit(
        sku: '23763',
        produitName: 'bitinla',
        description: lorem.sentence(2),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 560.03,
        quantity: 1),
    Produit(
        sku: '55209',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 26,
        quantity: 1),
    Produit(
        sku: '09853',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 26,
        quantity: 1),
    Produit(
        sku: '23463',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 34,
        quantity: 1),
    Produit(
        sku: '56783',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 7,
        quantity: 4),
    Produit(
        sku: '78256',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 23,
        quantity: 1),
    Produit(
        sku: '23745',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 94,
        quantity: 1),
    Produit(
        sku: '07834',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 12,
        quantity: 1),
    Produit(
        sku: '23547',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 34,
        quantity: 1),
    Produit(
        sku: '98387',
        produitName: 'bitinla',
        description: lorem.sentence(5),
        material: 'ISO',
        brand: 'new',
        imageUrl: LocalImages.androidRobotGifOne,
        category: 'Chasse',
        color: 'black',
        size: '5',
        price: 7.99,
        quantity: 2),
  ];

  final viewModel = DevisViewModel(
    invoiceNumber: '9654845',
    products: products,
    customerName: 'bobby la pointe',
    customerAddress: '59 rue du Fion de Notaire, 30000 Nîmes',
    paymentInfo: 'CB',
    tax: .25,
    baseColor: PdfColors.teal,
    accentColor: PdfColors.blueGrey900,
  );

  return await viewModel.buildPdf(format);
}

class DevisViewModel {
  DevisViewModel({
    required this.products,
    required this.customerName,
    required this.customerAddress,
    required this.invoiceNumber,
    required this.tax,
    required this.paymentInfo,
    required this.baseColor,
    required this.accentColor,
  });

  final List<Produit> products;
  final String customerName;
  final String customerAddress;
  final String invoiceNumber;
  final double tax;
  final String paymentInfo;
  final PdfColor baseColor;
  final PdfColor accentColor;

  static const _darkColor = PdfColors.blueGrey800;
  static const _lightColor = PdfColors.white;

  PdfColor get _baseTextColor => baseColor.isLight ? _lightColor : _darkColor;

  PdfColor get _accentTextColor => baseColor.isLight ? _lightColor : _darkColor;

  double get _total =>
      products.map<double>((p) => p.totalPrice).reduce((a, b) => a + b);

  double get _grandTotal => _total * (1 + tax);

  String? _andy;

  Future<Uint8List> buildPdf(PdfPageFormat format) async {
    _andy = Assets.lottie.models.andy.keyName;

    final pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
      pageTheme: _pageTheme(
          format,
          await PdfGoogleFonts.robotoRegular(),
          await PdfGoogleFonts.robotoBold(),
          await PdfGoogleFonts.robotoItalic()),
      header: _buildHeader,
      footer: _buildFooter,
      build: (context) => [
        _contentHeader(context),
        _contentTable(context),
        pw.SizedBox(height: 20),
        _contentFooter(context),
        pw.SizedBox(height: 20),
        _termsAndConditions(context),
      ],
    ));

    return pdf.save();
  }

  pw.PageTheme _pageTheme(
    PdfPageFormat format,
    pw.Font base,
    pw.Font bold,
    pw.Font italic,
  ) {
    return pw.PageTheme(
      pageFormat: format,
      theme: pw.ThemeData.withFont(
        base: base,
        bold: bold,
        italic: italic,
      ),
      /*buildBackground: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.SvgImage(svg: LocalImages.digitalTrans),
      ),*/
    );
  }

  pw.Widget _buildHeader(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(
              child: pw.Column(
                children: [
                  pw.Container(
                    height: 50,
                    padding: const pw.EdgeInsets.only(left: 20),
                    alignment: pw.Alignment.centerLeft,
                    child: pw.Text(
                      'DEVIS',
                      style: pw.TextStyle(
                        color: baseColor,
                        fontWeight: pw.FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  pw.Container(
                    decoration: pw.BoxDecoration(
                      borderRadius:
                          const pw.BorderRadius.all(pw.Radius.circular(2)),
                      color: accentColor,
                    ),
                    padding: const pw.EdgeInsets.only(
                        left: 40, top: 10, bottom: 10, right: 20),
                    alignment: pw.Alignment.centerLeft,
                    height: 50,
                    child: pw.DefaultTextStyle(
                      style: pw.TextStyle(
                        color: _accentTextColor,
                        fontSize: 12,
                      ),
                      child: pw.GridView(
                        crossAxisCount: 2,
                        children: [
                          pw.Text('Devis #'),
                          pw.Text(invoiceNumber),
                          pw.Text('Date:'),
                          pw.Text(_formatDate(DateTime.now())),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pw.Expanded(
              child: pw.Column(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  /*   pw.Container(
                    alignment: pw.Alignment.topRight,
                    padding: const pw.EdgeInsets.only(bottom: 8, left: 30),
                    height: 72,
                    child:
                        _andy != null ? pw.SvgImage(svg: _andy!) : pw.PdfLogo(),
                  ),*/
                  pw.Container(
                    color: baseColor,
                    alignment: pw.Alignment.topRight,
                    height: 72,
                    padding: pw.EdgeInsets.only(bottom: 8, left: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (context.pageNumber > 1) pw.SizedBox(height: 20)
      ],
    );
  }

  pw.Widget _buildFooter(pw.Context context) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Container(
          height: 20,
          width: 100,
          child: pw.BarcodeWidget(
            barcode: pw.Barcode.pdf417(),
            data: 'Invoice# $invoiceNumber',
            drawText: false,
          ),
        ),
        pw.Text(
          'Page ${context.pageNumber}/${context.pagesCount}',
          style: const pw.TextStyle(
            fontSize: 12,
            color: PdfColors.white,
          ),
        ),
      ],
    );
  }

  pw.Widget _contentHeader(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: pw.Container(
            margin: const pw.EdgeInsets.symmetric(horizontal: 20),
            height: 70,
            child: pw.FittedBox(
              child: pw.Text(
                'Total: ${_formatCurrency(_grandTotal)}',
                style: pw.TextStyle(
                  color: baseColor,
                  fontStyle: pw.FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        pw.Expanded(
          child: pw.Row(
            children: [
              pw.Container(
                margin: const pw.EdgeInsets.only(left: 10, right: 10),
                height: 70,
                child: pw.Text(
                  'Invoice to:',
                  style: pw.TextStyle(
                    color: _darkColor,
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              pw.Expanded(
                child: pw.Container(
                  height: 70,
                  child: pw.RichText(
                      text: pw.TextSpan(
                          text: '$customerName\n',
                          style: pw.TextStyle(
                            color: _darkColor,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 12,
                          ),
                          children: [
                        const pw.TextSpan(
                          text: '\n',
                          style: pw.TextStyle(
                            fontSize: 5,
                          ),
                        ),
                        pw.TextSpan(
                          text: customerAddress,
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 10,
                          ),
                        ),
                      ])),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _contentFooter(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          flex: 2,
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Thank you for your business',
                  style: pw.TextStyle(
                    color: _darkColor,
                    fontWeight: pw.FontWeight.bold,
                  )),
              pw.Container(
                  margin: const pw.EdgeInsets.only(top: 20, bottom: 8),
                  child: pw.Text('Payment Info:',
                      style: pw.TextStyle(
                        color: baseColor,
                        fontWeight: pw.FontWeight.bold,
                      ))),
              pw.Text(
                paymentInfo,
                style: const pw.TextStyle(
                  fontSize: 8,
                  lineSpacing: 5,
                  color: _darkColor,
                ),
              ),
            ],
          ),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.DefaultTextStyle(
              style: const pw.TextStyle(
                fontSize: 10,
                color: _darkColor,
              ),
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Sub Total:'),
                        pw.Text(_formatCurrency(_total))
                      ],
                    ),
                    pw.SizedBox(height: 5),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Tax:'),
                        pw.Text('${(tax * 100).toStringAsFixed(1)}%')
                      ],
                    ),
                    pw.Divider(color: accentColor),
                    pw.DefaultTextStyle(
                      style: pw.TextStyle(
                        color: baseColor,
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                      child: pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Text('Total:'),
                          pw.Text(_formatCurrency(_grandTotal)),
                        ],
                      ),
                    ),
                  ])),
        )
      ],
    );
  }

  pw.Widget _termsAndConditions(pw.Context context) {
    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Expanded(
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
              pw.Container(
                  decoration: pw.BoxDecoration(
                    border: pw.Border(top: pw.BorderSide(color: accentColor)),
                  ),
                  padding: const pw.EdgeInsets.only(top: 10, bottom: 4),
                  child: pw.Text(
                    'Terms and Conditions',
                    style: pw.TextStyle(
                        fontSize: 12,
                        color: baseColor,
                        fontWeight: pw.FontWeight.bold),
                  )),
              pw.Text(pw.LoremText().paragraph(40),
                  textAlign: pw.TextAlign.justify,
                  style: const pw.TextStyle(
                    fontSize: 6,
                    lineSpacing: 2,
                    color: _darkColor,
                  ))
            ])),
        pw.Expanded(child: pw.SizedBox()),
      ],
    );
  }

  pw.Widget _contentTable(pw.Context context) {
    const tableHeaders = [
      'SKU#',
      'Item Description',
      'Price',
      'Quantity',
      'Total',
    ];

    return pw.TableHelper.fromTextArray(
      border: null,
      cellAlignment: pw.Alignment.centerLeft,
      headerDecoration: pw.BoxDecoration(
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        color: baseColor,
      ),
      headerHeight: 25,
      cellHeight: 40,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.centerLeft,
        2: pw.Alignment.centerRight,
        3: pw.Alignment.center,
        4: pw.Alignment.centerRight,
      },
      headerStyle: pw.TextStyle(
        color: _baseTextColor,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(color: _darkColor, fontSize: 10),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: accentColor,
            width: .5,
          ),
        ),
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        products.length,
        (row) => List<String>.generate(
          tableHeaders.length,
          (col) => products[row].getIndex(col),
        ),
      ),
    );
  }

  String _formatCurrency(double amount) {
    return '\$${amount.toStringAsFixed(2)}';
  }

  String _formatDate(DateTime date) {
    final format = intl.DateFormat.yMMMd('fr_FR');
    return format.format(date);
  }
}
