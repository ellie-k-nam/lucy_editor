
import '../../lucy_editor.dart';
import 'abstract.dart';
import 'models/analysis_result.dart';
import 'models/issue.dart';

class DefaultLocalAnalyzer extends AbstractAnalyzer {
  const DefaultLocalAnalyzer();

  @override
  Future<AnalysisResult> analyze(CodeLines code) async {
    // final issues = code.invalidBlocks.map((e) => e.issue).toList(
    //       growable: false,
    //     );
    final issues = <Issue>[];
    return AnalysisResult(issues: issues);
  }
}
