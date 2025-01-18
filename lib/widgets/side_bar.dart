import 'package:flutter/material.dart';
import 'package:orion_ai/theme/colors.dart';
import 'package:orion_ai/widgets/sidebar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      width: isCollapsed ? 64 : 128,
      color: AppColors.sideNav,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.auto_awesome_mosaic,
                      color: AppColors.whiteColor,
                      size: 30,
                    )),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: isCollapsed
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SidebarButton(
                      isCollapsed: isCollapsed, icon: Icons.add, text: "Home"),
                  const SizedBox(
                    height: 20,
                  ),
                  SidebarButton(
                      isCollapsed: isCollapsed,
                      icon: Icons.search,
                      text: "Search"),
                  const SizedBox(
                    height: 20,
                  ),
                  SidebarButton(
                      isCollapsed: isCollapsed,
                      icon: Icons.language,
                      text: "Spaces"),
                  const SizedBox(
                    height: 20,
                  ),
                  SidebarButton(
                      isCollapsed: isCollapsed,
                      icon: Icons.auto_awesome,
                      text: "Discover"),
                  const SizedBox(
                    height: 20,
                  ),
                  SidebarButton(
                      isCollapsed: isCollapsed,
                      icon: Icons.cloud_outlined,
                      text: "Library"),
                  const Spacer(),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                });
              },
              icon: Icon(isCollapsed
                  ? Icons.keyboard_arrow_right
                  : Icons.keyboard_arrow_left),
              color: AppColors.iconGrey,
            ),
          ],
        ),
      ),
    );
  }
}
