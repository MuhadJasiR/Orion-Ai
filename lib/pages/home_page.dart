import 'package:flutter/material.dart';
import 'package:orion_ai/services/chat_web_service.dart';
import 'package:orion_ai/widgets/search_section.dart';
import 'package:orion_ai/widgets/side_bar.dart';

import '../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullResponse = "";
  @override
  void initState() {
    ChatWebService().connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        //side navbar
        const SideBar(),
        //search
        Expanded(
          child: Column(
            children: [
              const Expanded(child: SearchSection()),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Pro",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.footerGrey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "EnterPrise",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.footerGrey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Store",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.footerGrey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "Careers",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.footerGrey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "English",
                        style: TextStyle(
                            fontSize: 14, color: AppColors.footerGrey),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
