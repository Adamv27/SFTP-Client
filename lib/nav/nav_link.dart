import 'package:flutter/material.dart';
import 'package:sftp_client/nav/page_link.dart';

class NavLink extends StatefulWidget {
  const NavLink({
    super.key,
    required this.link,
    required this.onClick,
    required this.isSelected,
  });

  final PageLink link;
  final VoidCallback onClick;
  final bool isSelected;

  @override
  State<NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<NavLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Color? bgColor;
    if (isHovered) {
      bgColor = colorScheme.primary.withOpacity(0.1);
    }
    if (widget.isSelected) {
      bgColor = colorScheme.primary;
    }

    return InkWell(
      onHover: (hovering) => setState(() => isHovered = hovering),
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 4),
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            widget.link.icon,
            const SizedBox(width: 10),
            Text(widget.link.name),
          ],
        ),
      ),
    );
  }
}
