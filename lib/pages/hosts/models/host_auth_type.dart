import 'package:flutter/material.dart';

enum HostAuthType {
  password(icon: Icon(Icons.password)),
  key(icon: Icon(Icons.key)),
  none(icon: Icon(Icons.lock_open));

  const HostAuthType({
    required this.icon,
  });

  final Icon icon;
}
