import 'package:flutter/material.dart';
import 'package:sftp_client/nav/nav_menu.dart';
import 'package:sftp_client/window_bar/window_bar.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key, required this.pageContent});
  final Widget pageContent;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  Widget? currentPage;

  void setCurrentPage(Widget newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavMenu(onNav: setCurrentPage),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WindowBar(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: double.infinity,
                  child: currentPage ?? widget.pageContent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
