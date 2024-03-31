import 'package:flutter/material.dart';

class DescriptionEditorPage extends StatefulWidget {
  @override
  _DescriptionEditorPageState createState() => _DescriptionEditorPageState();
}

class _DescriptionEditorPageState extends State<DescriptionEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.98
          
          
          ),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              width: .5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                  maxLines: 100,
                  autofocus: true,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    width: .5,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.format_bold),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.format_italic),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.format_underlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.format_list_bulleted),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.format_list_numbered),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.link),
                          onPressed: () {},
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
