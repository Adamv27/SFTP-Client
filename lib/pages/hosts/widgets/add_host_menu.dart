import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/shared/dialog_menu.dart';

class AddHostMenu extends StatefulWidget {
  const AddHostMenu({super.key});

  @override
  State<AddHostMenu> createState() => _AddHostMenuState();
}

class _AddHostMenuState extends State<AddHostMenu> {
  Host host = Host(name: '', url: '');

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
    final fieldWidth = DialogMenu.maxWidth / 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        SizedBox(
          width: fieldWidth,
          child: TextField(
            onChanged: (value) => setState(() => host.hostName = value),
            decoration: const InputDecoration(
                hintText: 'Name', border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: fieldWidth * 1.5,
          child: TextField(
            onChanged: (value) => setState(() => host.url = value),
            decoration: const InputDecoration(
                hintText: 'URL', border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 12),
        _buildPortField(fieldWidth),
        const Divider(height: 30.0),
        SizedBox(
          width: fieldWidth,
          child: TextField(
            onChanged: (value) => setState(() => host.username = value),
            decoration: const InputDecoration(
                hintText: 'Username', border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 12),
        //SegmentedButton(segments: [], selected: )
      ],
    );
  }

  SizedBox _buildPortField(double fieldWidth) {
    return SizedBox(
      width: fieldWidth * 1 / 3,
      child: TextFormField(
        initialValue: '22',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => host.hostPort = int.tryParse(value),
        decoration: const InputDecoration(
          label: Text('Port'),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildControlButtons(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                WidgetStatePropertyAll(colorScheme.primary.withOpacity(0.50)),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Discard'),
        ),
        const SizedBox(width: 4),
        _saveButton(),
      ],
    );
  }

  Widget _saveButton() {
    return ElevatedButton(
      onPressed: () {
        if (host.name.isEmpty || host.url.isEmpty) return;
        Navigator.of(context).pop(host);
      },
      child: const Text('Save'),
    );
  }
}
