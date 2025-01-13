import 'package:flutter/material.dart';
import 'package:orion_ai/theme/colors.dart';

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
          crossAxisAlignment: isCollapsed
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
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
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: AppColors.iconGrey,
                ),
                isCollapsed ? const SizedBox() : const SizedBox(width: 10),
                isCollapsed ? const SizedBox() : const Text("Home")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.search,
                  color: AppColors.iconGrey,
                ),
                isCollapsed ? const SizedBox() : const SizedBox(width: 10),
                isCollapsed ? const SizedBox() : const Text("Home")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.language,
                  color: AppColors.iconGrey,
                ),
                isCollapsed ? const SizedBox() : const SizedBox(width: 10),
                isCollapsed ? const SizedBox() : const Text("Home")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color: AppColors.iconGrey,
                ),
                isCollapsed ? const SizedBox() : const SizedBox(width: 10),
                isCollapsed ? const SizedBox() : const Text("Home")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cloud_queue_sharp,
                  color: AppColors.iconGrey,
                ),
                isCollapsed ? const SizedBox() : const SizedBox(width: 10),
                isCollapsed ? const SizedBox() : const Text("Home")
              ],
            ),
            const Spacer(),
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
