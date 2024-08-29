class CurrentDirectory {
  CurrentDirectory({
    required String fullPath,
  }) : _fullPath = fullPath;

  String _fullPath;

  void moveBackDirectory() {
    if (_fullPath == '/') return;
    String newPath = _fullPath.substring(0, _fullPath.length - 1);
    final endOfPreviousPath = newPath.lastIndexOf('/') + 1;
    newPath = newPath.substring(0, endOfPreviousPath);
    _fullPath = newPath;
  }

  void enterDirectory(String directoryName) {
    if (directoryName == '..') {
      moveBackDirectory();
      return;
    }
    _fullPath = '$_fullPath$directoryName/';
  }

  String get fullPath => _fullPath;
}
