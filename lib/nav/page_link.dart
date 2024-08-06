import 'package:flutter/material.dart';
import 'package:sftp_client/pages/hosts/hosts_page.dart';
import 'package:sftp_client/pages/settings/settings_page.dart';
import 'package:sftp_client/pages/sftp/sftp_page.dart';
import 'package:sftp_client/pages/shell/shell_page.dart';

enum PageLink {
  hosts(
    content: HostsPage(),
    icon: Icon(Icons.computer),
    label: 'Hosts',
  ),
  sftp(
    content: SFTPPage(),
    icon: Icon(Icons.file_copy),
    label: 'SFTP',
  ),
  shell(
    content: ShellPage(),
    icon: Icon(Icons.code),
    label: 'Shell',
  ),
  settings(
    content: SettingsPage(),
    icon: Icon(Icons.settings),
    label: 'Settings',
  );

  const PageLink({
    required this.content,
    required this.icon,
    required this.label,
  });
  final Widget content;
  final Icon icon;
  final String label;
}
