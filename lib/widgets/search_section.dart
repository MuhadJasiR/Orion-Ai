import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orion_ai/pages/chat_page.dart';
import 'package:orion_ai/services/chat_web_service.dart';
import 'package:orion_ai/theme/colors.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController queryController = TextEditingController();
  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Where knowledge begin",
          style: GoogleFonts.ibmPlexMono(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              height: 1.2,
              letterSpacing: -0.5),
        ),
        const SizedBox(
          height: 32,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 700,
                decoration: BoxDecoration(
                    color: AppColors.searchBar,
                    border: Border.all(
                        color: AppColors.searchBarBorder, width: 1.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: queryController,
                          decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: "Search anything...",
                              hintStyle: TextStyle(
                                  color: AppColors.textGrey, fontSize: 16),
                              border: InputBorder.none),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const SearchBarButton(
                              icon: Icons.auto_awesome_outlined,
                              text: 'Focus',
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const SearchBarButton(
                              icon: Icons.add_circle_outline,
                              text: 'Attach',
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                ChatWebService()
                                    .chat(queryController.text.trim());
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatPage(
                                      question: queryController.text.trim()),
                                ));
                              },
                              child: Container(
                                padding: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    color: AppColors.submitButton,
                                    borderRadius: BorderRadius.circular(40)),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.background,
                                  size: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class SearchBarButton extends StatefulWidget {
  const SearchBarButton({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  State<SearchBarButton> createState() => _SearchBarButtonState();
}

class _SearchBarButtonState extends State<SearchBarButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: isHover ? AppColors.proButton : Colors.transparent,
            borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: AppColors.iconGrey,
              size: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              widget.text,
              style: const TextStyle(color: AppColors.textGrey),
            )
          ],
        ),
      ),
    );
  }
}
