import 'package:flutter/material.dart';
import 'package:sftp_client/pages/hosts/widgets/host_card.dart';

class HostsPage extends StatelessWidget {
  const HostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hosts',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        _hostsList(context),
        const SizedBox(height: 8),
        const Spacer(),
        _addHostButton(),
      ],
    );
  }

  Widget _hostsList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HostCard(
            name: 'Home',
            url: const String.fromEnvironment("SERVER_URL"),
            username: const String.fromEnvironment("SERVER_USERNAME"),
            port: int.parse(const String.fromEnvironment("SERVER_PORT")),
          ),
          const SizedBox(height: 8),
          HostCard(
            name: 'Work',
            url: const String.fromEnvironment("SERVER_URL"),
            username: const String.fromEnvironment("SERVER_USERNAME"),
            port: int.parse(const String.fromEnvironment("SERVER_PORT")),
          ),
        ],
      ),
    );
  }

  Widget _addHostButton() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Add'),
    );
  }
}
