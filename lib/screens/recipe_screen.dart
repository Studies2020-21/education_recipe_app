import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class RecipeScreen extends StatelessWidget {
  static const routeName = '/recipe-detail';

  @override
  Widget build(BuildContext context) {
    // Get all arguments that were forwarded to this route
    final Map _args = ModalRoute.of(context).settings.arguments as Map;
    // Replace all linebreaks in the body text
    final String _bodyText = _args['body'].replaceAll('\\n', '\n');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _args['color'],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(_args['title']),
        centerTitle: true,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _args['image'] == null
                ? Container()
                : Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      _args['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    _args['title'],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  if (_args['textType'] == 'markdown')
                    MarkdownBody(data: _bodyText)
                  else
                    Text(_bodyText),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Repository Metadata',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (_args['createdAt'] != null)
                    Row(
                      children: [
                        Icon(Icons.cloud_upload, color: Colors.grey),
                        SizedBox(width: 6),
                        Text(
                            'added ' +
                                DateFormat('dd.MM.yyyy')
                                    .format(_args['createdAt'].toDate()),
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  if (_args['updatedAt'] != null)
                    Row(
                      children: [
                        Icon(Icons.cloud_done, color: Colors.grey),
                        SizedBox(width: 6),
                        Text(
                            'updated ' +
                                DateFormat('dd.MM.yyyy')
                                    .format(_args['updatedAt'].toDate()),
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  if (_args['author'] != null)
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.grey),
                        SizedBox(width: 6),
                        Text('by ' + _args['author'],
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  if (_args['createdAt'] == null &&
                      _args['updatedAt'] == null &&
                      _args['author'] == null)
                    Text('Sorry, no metadata available.',
                        style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
