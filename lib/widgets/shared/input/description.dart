import 'package:flutter/material.dart';

class DescriptionEditorPage extends StatefulWidget {
  @override
  _DescriptionEditorPageState createState() => _DescriptionEditorPageState();
}

class _DescriptionEditorPageState extends State<DescriptionEditorPage> {
  //TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;

    // Set preferred width and height (adjust these based on user preferences)
    double preferredHeight = screenSize.height * 0.5;

    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: preferredHeight,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none
                  ),
                  maxLines: 100,
                  autofocus: true,
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 20,
              shadowColor: Colors.black,
              color: Theme.of(context).secondaryHeaderColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.format_bold),
                          onPressed: () {
                            // Handle bold button press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.format_italic),
                          onPressed: () {
                            // Handle italic button press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.format_underlined),
                          onPressed: () {
                            // Handle underline button press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.format_list_bulleted),
                          onPressed: () {
                            // Handle bullet list button press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.format_list_numbered),
                          onPressed: () {
                            // Handle numbered list button press
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.link),
                          onPressed: () {
                            // Handle link button press
                          },
                        ),
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('CANCEL'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('SAVE'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
