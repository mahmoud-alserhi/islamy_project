import 'dart:io';

import 'package:path/path.dart' as path;

String _formatVariableName(String name) {
  return name
      .replaceAll(RegExp(r'[^a-zA-Z0-9]'), ' ')
      .split(' ')
      .where((word) => word.isNotEmpty)
      .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join()
      .replaceFirstMapped(
          RegExp(r'^[A-Z]'), (match) => match.group(0)!.toLowerCase());
}

Future<void> generateIconsClass() async {
  try {
    // المسار الصحيح داخل مجلد المشروع
    final projectDir = path.dirname(Platform.script.toFilePath());
    final assetsDir = Directory(path.join(projectDir, 'assets', 'icons'));

    print('🔍 Searching in: ${assetsDir.path}');

    if (!await assetsDir.exists()) {
      print('❌ Directory missing. Creating it...');
      await assetsDir.create(recursive: true);
      print('✅ Created: ${assetsDir.path}');
      print('ℹ️ Add your icons and rerun');
      return;
    }

    final files = await assetsDir.list().toList();
    final iconFiles = files.whereType<File>().where((f) {
      final ext = path.extension(f.path).toLowerCase();
      return ['.svg', '.png', '.jpg'].contains(ext);
    }).toList();

    if (iconFiles.isEmpty) {
      print('ℹ️ No icons found. Add some icons to ${assetsDir.path}');
      return;
    }

    final buffer = StringBuffer()
      ..writeln('class IconsApp {')
      ..writeln('  IconsApp._();\n');

    for (final file in iconFiles) {
      final name = path.basenameWithoutExtension(file.path);
      final ext = path.extension(file.path).replaceFirst('.', '');
      final varName = _formatVariableName(name);
      buffer.writeln(
          "  static const String $varName = 'assets/icons/$name.$ext';");
    }

    buffer.writeln('}');

    final outputFile =
        File(path.join(projectDir, 'lib', 'core', 'utils', 'icons_app.dart'));
    await outputFile.create(recursive: true);
    await outputFile.writeAsString(buffer.toString());

    print('✅ Generated: ${outputFile.path}');
    print('🔄 Restart your app');
  } catch (e) {
    print('❌ Error: ${e.toString()}');
    print(
        'ℹ️ Solution: Manually create assets/icons folder in your project root');
  }
}
