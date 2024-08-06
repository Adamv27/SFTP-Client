import 'package:flutter/material.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/shared/dialog_menu.dart';

class AddHostMenu extends StatefulWidget {
  const AddHostMenu({super.key});

  @override
  State<AddHostMenu> createState() => _AddHostMenuState();
}

class _AddHostMenuState extends State<AddHostMenu> {
  String? name = '';
  String? url = '';
  String? username = '';
  int? port = 22;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DialogMenu(
      menuContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Host',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          _buildFormFields(context),
          const Spacer(),
          _buildControlButtons(context),
        ],
      ),
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) => setState(() => name = value),
          decoration: const InputDecoration(
              hintText: 'Name', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) => setState(() => url = value),
          decoration: const InputDecoration(
              hintText: 'URL', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) => setState(() => username = value),
          decoration: const InputDecoration(
              hintText: 'Username', border: OutlineInputBorder()),
        ),
        const SizedBox(height: 8),
        TextField(
          onChanged: (value) => setState(() => port = int.tryParse(value)),
          decoration: const InputDecoration(
            hintText: 'Port',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildControlButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        const SizedBox(width: 4),
        ElevatedButton(
          onPressed: () {
            if (name != null && url != null) {
              Navigator.of(context).pop(Host(
                name: name!,
                username: username,
                url: url!,
                port: port ?? 22,
              ));
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
