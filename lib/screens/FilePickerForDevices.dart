
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class FilePickerForDevices {

  Future<List<String?>?> selectMedia() {
    return Platform.isIOS
        ? FilePicker.platform
        .pickFiles(type: FileType.media, allowMultiple: true)
        .then<List<String?>?>((value) => value?.paths)
        : ImagePicker()
        .pickMultipleMedia()
        .then<List<String?>?>((value) => value.map((e) => e.path).toList());
  }




}