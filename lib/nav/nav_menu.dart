import 'package:flutter/material.dart';
import 'package:sftp_client/nav/nav_link.dart';
import 'package:sftp_client/nav/page_link.dart';
import 'package:sftp_client/window_bar/window_title.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({
    super.key,
    required this.onNav,
  });

  final Function(Widget newPage) onNav;

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  PageLink selectedLink = PageLink.hosts;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.secondaryContainer,
      width: 155,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WindowTitle(),
          _buildNavLinks(context),
        ],
      ),
    );
  }

  Widget _buildNavLinks(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: PageLink.values.map((link) {
          bool isSelected = selectedLink == link;
          return NavLink(
            link: link,
            onClick: () {
              widget.onNav(link.content);
              setState(() {
                selectedLink = link;
              });
            },
            isSelected: isSelected,
          );
        }).toList(),
      ),
    );
  }
}
