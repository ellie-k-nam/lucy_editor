import 'dart:async';

import '../../lucy_editor.dart';
import 'models/analysis_result.dart';

/// Service for analyzing the code inside [CodeField].
///
/// Inherit and implement [analyze] method to use in [CodeController].
abstract class AbstractAnalyzer {
  const AbstractAnalyzer();

  /// Analyzes the code and generates new list of issues.
  Future<AnalysisResult> analyze(CodeLines code);

  void dispose() {}
}
