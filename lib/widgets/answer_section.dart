import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:orion_ai/services/chat_web_service.dart';
import 'package:orion_ai/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String fullResponse = '''
  5th Test: Australia vs India
  Location: Sydney
  Date: January 4, 2025
  Result: Australia won by 6 wickets.
  Score Summary:
  India's First Innings: 185 all out (72.2 overs)
  Australia's First Innings: 181 all out (51 overs)
  India's Second Innings: 157 all out (39.5 overs)
  Australia's Second Innings: 162 for 4 (27 overs)
  Australia successfully chased down the target after bowling out India for 157 in their second innings. Scott Boland was instrumental in India's collapse, taking four wickets on Day 2, which left India struggling at 141 for 6 at stumps. Rishabh Pant scored a notable 61 runs in India's second innings but it wasn't enough to secure a draw or win27.
  4th Test: Australia vs India
  Location: Melbourne
  Date: December 30, 2024
  Result: Australia won by 184 runs.
  Score Summary:
  Australia's First Innings: 474 all out (122.4 overs)
  India's First Innings: 369 all out (119.3 overs)
  Australia's Second Innings: 234 all out (83.4 overs)
  India's Second Innings: 155 all out (79.1 overs)
  In this match, Australia set a formidable target with a first innings total of 474. India fought back with a strong first innings of their own but fell short in the second innings, leading to a decisive victory for Australia15.
''';
  @override
  void initState() {
    ChatWebService().contentStream.listen(
      (data) {
        if (isLoading) {
          fullResponse = '';
        }
        setState(() {
          fullResponse += data["data"];
          isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Orion Ai",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
              data: fullResponse,
              shrinkWrap: true,
              styleSheet:
                  MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                      codeblockDecoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      code: const TextStyle(fontSize: 16))),
        )
      ],
    );
  }
}
