import 'package:figma_009/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  if (kIsWeb) {
    GoogleFonts.config.allowRuntimeFetching = true;
  }
  runApp(WalletApp());
}
