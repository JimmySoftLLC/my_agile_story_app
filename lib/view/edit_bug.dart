import 'package:flutter/material.dart';
import 'package:my_agile_story_flutter_app/controller/project.dart';
import 'package:my_agile_story_flutter_app/view/logged_in_page.dart';
import 'package:my_agile_story_flutter_app/controller/bug_api.dart';
import 'package:my_agile_story_flutter_app/controller/bug.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditBug extends StatefulWidget {
  static const String id ='/EditBug';
  @override
  _EditBugState createState() => _EditBugState();
}

class _EditBugState extends State<EditBug> {
  String myText = '';
  double myRadius = 14.0;
  int myRadioValue = int.parse(myBugs[myLastSelectedBug].phase);

  void validateEntries() {
    setState(() {
      myText = 'Saving bug please wait.';
    });
    if (myLastSelectedProject >= 0 && myLastSelectedProject < myProjects.length){
      if (myLastSelectedBug >= 0 && myLastSelectedBug < myBugs.length){
        updateBug(myProjects[myLastSelectedProject], myBugs[myLastSelectedBug],context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Story',style: TextStyle(fontSize: 17,)),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          // overflow menu
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              tooltip: 'Go back',
              icon: Icon(FontAwesomeIcons.angleLeft), onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, MyLoggedInPage.id,(Route<dynamic> route) => false);
                },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 24.0,
              ),
              TextField(
                controller: TextEditingController()..text = myBugs[myLastSelectedBug].bugTitle,
                onChanged: (value) {
                  myBugs[myLastSelectedBug].bugTitle = value;
                },
                decoration: InputDecoration(
                  hintText: 'Bug title',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                maxLines: 4,
                controller: TextEditingController()..text = myBugs[myLastSelectedBug].summary,
                onChanged: (value) {
                  myBugs[myLastSelectedBug].summary = value;
                },
                decoration: InputDecoration(
                  hintText: 'Summary',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                maxLines: 4,
                controller: TextEditingController()..text = myBugs[myLastSelectedBug].stepsToReproduce,
                onChanged: (value) {
                  myBugs[myLastSelectedBug].stepsToReproduce = value;
                },
                decoration: InputDecoration(
                  hintText: 'Steps To Reproduce',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                maxLines: 4,
                controller: TextEditingController()..text = myBugs[myLastSelectedBug].expectedResults,
                onChanged: (value) {
                  myBugs[myLastSelectedBug].expectedResults = value;
                },
                decoration: InputDecoration(
                  hintText: 'Expected Results',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                maxLines: 4,
                controller: TextEditingController()..text = myBugs[myLastSelectedBug].actualResults,
                onChanged: (value) {
                  myBugs[myLastSelectedBug].actualResults = value;
                },
                decoration: InputDecoration(
                  hintText: 'Actual Results',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                maxLines: 4,
                controller: TextEditingController()..text = myBugs[myLastSelectedBug].resolution,
                onChanged: (value) {
                  myBugs[myLastSelectedBug].resolution = value;
                },
                decoration: InputDecoration(
                  hintText: 'Resolution',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                maxLines: 4,
                controller: TextEditingController()..text = myBugs[myLastSelectedBug].acceptanceCriteria,
                onChanged: (value) {
                  myBugs[myLastSelectedBug].acceptanceCriteria = value;
                },
                decoration: InputDecoration(
                  hintText: 'Acceptance Criteria',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Estimate',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: TextEditingController()..text = myBugs[myLastSelectedBug].estimate.toString(),
                      onChanged: (value) {
                        myBugs[myLastSelectedBug].estimate  = int.parse(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'points',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Complete',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: TextEditingController()..text = myBugs[myLastSelectedBug].percentDone.toString(),
                      onChanged: (value) {
                        myBugs[myLastSelectedBug].percentDone  = int.parse(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'percent',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Priority',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: TextEditingController()..text = myBugs[myLastSelectedBug].priority.toString(),
                      onChanged: (value) {
                        myBugs[myLastSelectedBug].priority  = int.parse(value);
                      },
                      decoration: InputDecoration(
                        hintText: '1-10',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Sprint',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: TextEditingController()..text = myBugs[myLastSelectedBug].sprint.toString(),
                      onChanged: (value) {
                        myBugs[myLastSelectedBug].sprint  = int.parse(value);
                      },
                      decoration: InputDecoration(
                        hintText: '1,2,3...',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: const Text('To Do'),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                leading: Radio(
                  value: 0,
                  groupValue: myRadioValue,
                  onChanged: (value) {
                    myBugs[myLastSelectedBug].phase = '0';
                    setState(() { myRadioValue = value; });
                  },
                ),
              ),
              ListTile(
                title: const Text('Doing'),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                leading: Radio(
                  value: 1,
                  groupValue: myRadioValue,
                  onChanged: (value) {
                    myBugs[myLastSelectedBug].phase = '1';
                    setState(() { myRadioValue = value; });
                  },
                ),
              ),
              ListTile(
                title: const Text('Verify') ,
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                leading: Radio(
                  value: 2,
                  groupValue: myRadioValue,
                  onChanged: (value) {
                    myBugs[myLastSelectedBug].phase = '2';
                    setState(() { myRadioValue = value; });
                  },
                ),
              ),
              ListTile(
                title: const Text('Done'),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                leading: Radio(
                  value: 3,
                  groupValue: myRadioValue,
                  onChanged: (value) {
                    myBugs[myLastSelectedBug].phase = '3';
                    setState(() { myRadioValue = value; });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      validateEntries();
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Save changes',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                myText,
              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}