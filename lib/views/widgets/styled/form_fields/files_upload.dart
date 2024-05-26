import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploadDropZone extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  const FileUploadDropZone({
    Key? key,
    required this.title,
    required this.controller,
  }) : super(key: key);

  @override
  _FileUploadDropZoneState createState() => _FileUploadDropZoneState();
}

class _FileUploadDropZoneState extends State<FileUploadDropZone> {
  List<File> _files = [];

  @override
  void initState() {
    super.initState();
    _files = widget.controller.text.isEmpty
        ? []
        : widget.controller.text.split(',').map((path) => File(path)).toList();
  }

  void _pickFiles() async {
    if (_files.length >= 3) return;

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png'],
        allowMultiple: true,
      );

      if (result != null) {
        List<PlatformFile> pickedFiles = result.files;

        List<File> validFiles = pickedFiles
            .where((file) {
              return file.size <= 1 * 1024 * 1024; // File size limit: 1MB
            })
            .map((file) => File(file.path!))
            .toList();

        if (validFiles.length + _files.length > 3) {
          validFiles = validFiles.sublist(0, 3 - _files.length);
        }

        setState(() {
          _files.addAll(validFiles);
        });

        widget.controller.text = _files.map((file) => file.path).join(',');
      }
    } catch (e) {
      print("File picking failed: $e");
    }
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });

    widget.controller.text = _files.map((file) => file.path).join(',');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            border: Border.all(
                width: 2,
                color: Theme.of(context).primaryColor.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: _files.isEmpty
              ? GestureDetector(
                  onTap: _pickFiles,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_upload,
                          size: 35.0, color: Theme.of(context).primaryColor),
                      SizedBox(height: 8.0),
                      Text(
                        'Tap to upload files\nMaximum size 1MB',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                )
              : Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8.0,
                        children: List.generate(_files.length, (index) {
                          File file = _files[index];
                          return Stack(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: FileImage(file),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                right: -5,
                                child: IconButton(
                                  icon: Icon(Icons.remove_circle,
                                      color: Colors.red, size: 20),
                                  onPressed: () => _removeFile(index),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                    if (_files.length < 3)
                      IconButton(
                        icon: Icon(Icons.add_circle,
                            color: Theme.of(context).primaryColor, size: 30),
                        onPressed: _pickFiles,
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}
