import 'package:coding_test/screens/problem_solving_screen.dart';
import 'package:flutter/material.dart';

class ProblemStatementSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6c757d),
        appBar: AppBar(
          title: Text("Hii Aditya, Test Your Coding Skills", style: TextStyle(color: Colors.white,),),
          centerTitle: true,
          backgroundColor: Color(0xff343a40),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _problems.length,
            itemBuilder: (context, index) {
              final problem = _problems[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                      builder: (context) =>
                      CodeEditorScreen(
                          problemIndex: index,
                          problemTitle: problem['title']?? "",
                          problemDescription: problem['description']?? "")));
                  },
                child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0x30dee2e6),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffCCCCCC),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                problem['title'] ?? '',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                problem['description'] ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black45
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
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
}
