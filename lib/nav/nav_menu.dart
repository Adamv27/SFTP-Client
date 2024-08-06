import 'package:flutter/material.dart';
import 'package:sftp_client/pages/home/home.dart';
import 'package:sftp_client/pages/profiles/profiles.dart';
import 'package:sftp_client/pages/settings/settings.dart';
import 'package:sftp_client/pages/upload/upload.dart';
import 'package:sftp_client/window_bar/window_title.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({
    super.key,
    required this.onNav,
  });

  final Function(Widget newPage) onNav;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.secondaryContainer,
      width: 150,
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: () => onNav(const HomePage()),
            icon: const Icon(Icons.home),
            label: const Text('Home'),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () => onNav(const UploadPage()),
            icon: const Icon(Icons.upload),
            label: const Text('Upload'),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () => onNav(const ProfilesPage()),
            icon: const Icon(Icons.person),
            label: const Text('Profiles'),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () => onNav(const SettingsPage()),
            icon: const Icon(Icons.settings),
            label: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
