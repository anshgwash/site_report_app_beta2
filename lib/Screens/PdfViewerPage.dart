import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:share/share.dart';

class PdfViewerPage extends StatelessWidget {
  final String path;
  final pdf;
  final shareName;

  const PdfViewerPage({Key key, this.path, this.pdf, this.shareName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('PDF output'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () async {
                Share.shareFiles([path], subject: '$shareName.pdf');
              }),
        ],
      ),
      path: path,
    );
  }
}
