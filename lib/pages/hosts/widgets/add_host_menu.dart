import 'package:file_picker/file_picker.dart';
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
  TextEditingController keyPathController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            onChanged: (value) => host.name = value,
            decoration: const InputDecoration(
                hintText: 'Name', border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: fieldWidth * 1.5,
          child: TextField(
            onChanged: (value) => host.url = value,
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
            onChanged: (value) => host.username = value,
            decoration: const InputDecoration(
                hintText: 'Username', border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 12),
        _buildAuthFields(fieldWidth),
      ],
    );
  }

  SizedBox _buildPortField(double fieldWidth) {
    return SizedBox(
      width: fieldWidth * 1 / 3,
      child: TextFormField(
        initialValue: '22',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) => host.port = int.tryParse(value),
        decoration: const InputDecoration(
          label: Text('Port'),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  DefaultTabController _buildAuthFields(double fieldWidth) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: fieldWidth,
            child: const TabBar(
              tabs: [
                Tab(text: 'Password'),
                Tab(text: 'Key'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            width: DialogMenu.maxWidth * 0.75,
            height: 125,
            child: TabBarView(
              children: [
                _buildPasswordTabView(),
                _buildKeyTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTabView() {
    return Column(children: [
      TextField(
        obscureText: true,
        onChanged: (value) => host.password = value,
        decoration: const InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(),
        ),
      ),
      Row(children: [
        Checkbox(
          value: host.savePassword,
          onChanged: (value) {
            if (value != null) {
              setState(() => host.savePassword = value);
            }
          },
        ),
        const Text('Save password')
      ])
    ]);
  }

  Widget _buildKeyTabView() {
    return Column(children: [
      Row(children: [
        SizedBox(
          width: 200,
          child: TextField(
            controller: keyPathController,
            onChanged: (value) => host.keyPath = value,
            decoration: const InputDecoration(
              hintText: 'SSH key path',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              final String? path = result.files.single.path;
              host.keyPath = path;
              setState(
                () => keyPathController = TextEditingController(text: path),
              );
            }
          },
          child: const Text('Open'),
        )
      ])
    ]);
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
