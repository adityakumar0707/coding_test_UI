import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';


class CodeEditorScreen extends StatelessWidget {
  final int problemIndex;
  final String problemTitle;
  final String problemDescription;

  const CodeEditorScreen({
    required this.problemIndex,
    required this.problemTitle,
    required this.problemDescription,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CodeController(
      text: '...',
      language: dart,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6c757d),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Write your solution',style: TextStyle(color: Colors.white,),),
          centerTitle: true,
          backgroundColor: Color(0xff343a40),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$problemTitle',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$problemDescription',
                      style: TextStyle(color: Colors.white,fontSize: 18)
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: CodeTheme(
                      data: CodeThemeData(styles: monokaiSublimeTheme),
                      child: CodeField(
                        controller: controller,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _showSubmitConfirmationDialog(context);
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,letterSpacing: 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  static const List<Map<String, String>> _problems = [
    {
      'title': 'Problem 1',
      'description': 'Write a program to print Hello I am “John Doe” and Hello I’am “John Doe” with single and double quotes.',
    },
    {
      'title': 'Problem 2',
      'description': 'Write a program in Dart to remove all whitespaces from String.',
    },
    {
      'title': 'Problem 3',
      'description': 'Suppose, you often go to restaurant with friends and you have to split amount of bill. Write a program to calculate split amount of bill. Formula= (total bill amount) / number of people',
    },
    {
      'title': 'Problem 4',
      'description': 'Write a Dart program which accepts the radius of a circle from the user and compute the area.',
    },
    {
      'title': 'Problem 5',
      'description': 'Write a Dart program which accepts a sequence of comma-separated numbers from user and generate a list and a tuple with those numbers. Sample data : 3, 5, 7, 23 Output : List : [\'3\', \' 5\', \' 7\', \' 23\'] Set : (\'3\', \' 5\', \' 7\', \' 23\')',
    },
  ];
  void _showSubmitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[300],
          title: Text(
            'Note: Submissions with plagiarized code will be disqualified.',
            style: TextStyle(fontSize: 19, ),
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                child: Row(
                  children: [
                    Text(
                      'Cancel',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Spacer(),
              ElevatedButton(
                child: Row(
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(fontSize: 18),
                    ),
                    Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate to the next problem
                  if (problemIndex < _problems.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CodeEditorScreen(
                          problemIndex: problemIndex + 1,
                          problemTitle: _problems[problemIndex + 1]['title'] ?? "",
                          problemDescription: _problems[problemIndex + 1]['description'] ?? "",
                        ),
                      ),
                    );
                  } else {
                    // Show a message indicating the last problem is complete
                    // or navigate back to the home screen
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
