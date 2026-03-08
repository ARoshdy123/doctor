import 'dart:io';

import 'package:doctor/core/theming/colors.dart';
import 'package:doctor/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewerScreen extends StatefulWidget {
  final String title;
  final String assetPath;
  final bool triggerDownload;

  const PdfViewerScreen({
    super.key,
    required this.title,
    required this.assetPath,
    this.triggerDownload = false,
  });

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  String? _localPath;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    final data = await rootBundle.load(widget.assetPath);
    final dir = await getTemporaryDirectory();
    final fileName = widget.assetPath.split('/').last;
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(data.buffer.asUint8List());
    setState(() {
      _localPath = file.path;
      _isLoading = false;
    });

    if (widget.triggerDownload) {
      _downloadPdf();
    }
  }

  Future<void> _downloadPdf() async {
    try {
      final data = await rootBundle.load(widget.assetPath);
      final fileName = widget.assetPath.split('/').last;

      final dir =
          await getExternalStorageDirectory() ??
          await getApplicationDocumentsDirectory();

      final downloadsDir = Directory('${dir.path}/Downloads');
      if (!await downloadsDir.exists()) {
        await downloadsDir.create(recursive: true);
      }

      final file = File('${downloadsDir.path}/$fileName');
      await file.writeAsBytes(data.buffer.asUint8List(), flush: true);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Saved: $fileName'),
            backgroundColor: ColorsManager.mainBlue,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Download failed: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ColorsManager.darkBlue,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(widget.title, style: TextStyles.font18DarkBlueSemiBold),
        actions: [
          IconButton(
            icon: const Icon(Icons.download, color: ColorsManager.mainBlue),
            onPressed: _downloadPdf,
          ),
        ],
      ),
      body:
          _isLoading
              ? const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              )
              : PDFView(
                filePath: _localPath!,
                enableSwipe: true,
                swipeHorizontal: false,
                autoSpacing: true,
                pageFling: true,
              ),
    );
  }
}
