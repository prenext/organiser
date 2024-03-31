import 'dart:io';
import 'package:Organiser/views/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class FilePickerPage extends StatefulWidget {
  @override
  _FilePickerPageState createState() => _FilePickerPageState();
}

class _FilePickerPageState extends State<FilePickerPage> {
  List<File> _imageFiles = [];
  List<File> _videoFiles = [];
  List<bool> _imageSelections = [];
  List<bool> _videoSelections = [];

  @override
  void initState() {
    super.initState();
    _imageSelections = List.generate(_imageFiles.length, (_) => false);
    _videoSelections = List.generate(_videoFiles.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text('File Picker'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Images'),
              Tab(text: 'Videos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGridView(_imageFiles, _imageSelections),
            _buildGridView(_videoFiles, _videoSelections),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Text('Selected: ${_selectedFilesCount()}'),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  for (int i = 0; i < _imageSelections.length; i++) {
                    if (_imageSelections[i]) {
                      _imageFiles.removeAt(i);
                      _imageSelections.removeAt(i);
                      i--;
                    }
                  }
                  for (int i = 0; i < _videoSelections.length; i++) {
                    if (_videoSelections[i]) {
                      _videoFiles.removeAt(i);
                      _videoSelections.removeAt(i);
                      i--;
                    }
                  }
                  setState(() {});
                },
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: openFilePicker,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(List<File> files, List<bool> selections) {
    return GridView.builder(
      itemCount: files.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selections[index] = !selections[index];
                });
              },
              child: GridTile(
                child: files[index].path.endsWith('.mp4')
                    ? VideoPlayer(_initializeVideoPlayer(files[index]))
                    : Image.file(files[index], fit: BoxFit.cover),
              ),
            ),
            if (selections[index])
              Positioned(
                top: 8,
                left: 8,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.blue,
                ),
              ),
          ],
        );
      },
    );
  }

  Future<void> openFilePicker() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final List<XFile>? pickedFiles =
          await _picker.pickMultiImage(imageQuality: 70);
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        for (final file in pickedFiles) {
          if (file.path.endsWith('.mp4')) {
            _videoFiles.add(File(file.path));
            _videoSelections.add(false);
          } else {
            _imageFiles.add(File(file.path));
            _imageSelections.add(false);
          }
        }
        setState(() {});
      } else {
        // User canceled the picker
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error while picking file: $e');
    }
  }

  VideoPlayerController _initializeVideoPlayer(File file) {
    return VideoPlayerController.file(file)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  int _selectedFilesCount() {
    return _imageSelections.where((selected) => selected).length +
        _videoSelections.where((selected) => selected).length;
  }
}
