import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_agile_story_flutter_app/controller/bug.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:my_agile_story_flutter_app/view/logged_in_page.dart';

const double userStoryCardHeight = 130;

List<BugCard> updateBugCards(String selectedPhase) {
  List<Widget> userStoryCards = <BugCard>[];
  String userStoryBody;
  IconData myIcon;
  String myBugTitle;
  int percentDone;
  for (int i = 0; i < myBugs.length; i++) {
    if (selectedPhase == myBugs[i].phase) {
      switch (myBugs[i].phase) {
        case '0':
          {
            myIcon = FontAwesomeIcons.running;
          }
          break;
        case '1':
          {
            myIcon = FontAwesomeIcons.check;
          }
          break;
        case '2':
          {
            myIcon = FontAwesomeIcons.handsHelping;
          }
          break;
        case '3':
          {}
          break;
        default:
          {}
          break;
      }
      userStoryBody = 'As a ' +
          myBugs[i].userRole +
          ', I want ' +
          myBugs[i].userWant +
          ' so that ' +
          myBugs[i].userBenefit;
      myBugTitle = 'S' + myBugs[i].sprint.toString() + ' - ' + myBugs[i].userStoryTitle;

      percentDone = myBugs[i].percentDone;
      if (percentDone < 0) {myBugs[i].percentDone = 0;}
      if (percentDone > 100) {myBugs[i].percentDone = 100;}
      percentDone = myBugs[i].percentDone;

      if (myBugs[i].priority < 1) {myBugs[i].priority = 1;}
      if (myBugs[i].priority > 10) {myBugs[i].priority = 10;}

      userStoryCards.add(new BugCard(
        userStoryTitle: myBugTitle,
        userStoryBody: userStoryBody,
        index: i,
        phaseIcon: myIcon,
        percentDoneValue: percentDone/100,
        percentDoneText: percentDone.toString() + '%',
        estimate: myBugs[i].estimate.toString(),
        sliderVal:myBugs[i].priority,
      ));
    }
  }
  return userStoryCards;
}

class BugCard extends StatefulWidget {
  BugCard({@required this.userStoryTitle,
    @required this.userStoryBody,
    @required this.index,
    @required this.phaseIcon,
    @required this.percentDoneValue,
    @required this.percentDoneText,
    @required this.estimate,
    @required this.sliderVal,
  });

  final String userStoryTitle;
  final String userStoryBody;
  final int index;
  final IconData phaseIcon;
  final double percentDoneValue;
  final String percentDoneText;
  final String estimate;
  final int sliderVal;

  @override
  State<BugCard> createState() => new _BugCardState();
}

class _BugCardState extends State<BugCard> {
  String _userStoryTitle;
  String _userStoryBody;
  int _index;
  IconData _phaseIcon;
  double _percentDoneValue;
  String _percentDoneText;
  String _estimate;
  int _sliderVal;
  bool _hitState = false;

  @override
  void initState() {
    super.initState();
    _userStoryTitle = widget.userStoryTitle;
    _userStoryBody = widget.userStoryBody;
    _index = widget.index;
    _phaseIcon = widget.phaseIcon;
    _percentDoneValue = widget.percentDoneValue;
    _percentDoneText = widget.percentDoneText;
    _estimate = widget.estimate;
    _sliderVal = widget.sliderVal;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Container(
              padding: new EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      _userStoryTitle,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        //color: Colors.blue,
                      )),

                  SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    _userStoryBody,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex:8,
                        child: LinearPercentIndicator(
                          lineHeight: 14.0,
                          percent: _percentDoneValue,
                          center: Text(
                            _percentDoneText,
                            style: TextStyle(fontSize: 12.0),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          _estimate,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        tooltip: 'Edit user story',
                        icon: Icon(FontAwesomeIcons.edit),
                        onPressed: () => editBugPressed(_index, context),
                      ),
                      IconButton(
                        tooltip: 'Delete user story',
                        icon: Icon(FontAwesomeIcons.trash),
                        onPressed: () => deleteBugPressed(_index, context),
                      ),
                      IconButton(
                        tooltip: 'Send to sprint',
                        icon: Icon(_phaseIcon),
                        onPressed: () =>
                            moveBugToNextPhasePressed(_index, context),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Slider(
                    value: _sliderVal.toDouble(),
                    min: 1.0,
                    max: 10.0,
                    divisions: 10,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.black,
                    label: _sliderVal.toString(),
                    onChanged: (double changedValue) {
                      setState(() {
                        _sliderVal = changedValue.round();
                      });
                    },
                    onChangeEnd: (double endValue) {
                      if (!_hitState) {
                        _hitState=true;
                        var endValueToSend = endValue.round();
                        changeBugPriorityUsingSlider(_index, endValueToSend.toInt(),context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      height: userStoryCardHeight,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

editBugPressed(index, context) {
  myLastSelectedBug = index;
  myLastSelectedPhase = myBugs[index].phase;
  MyLoggedInPage.of(context).editBugInContext();
}

deleteBugPressed(index, context) {
  myLastSelectedBug = index;
  myLastSelectedPhase = myBugs[index].phase;
  MyLoggedInPage.of(context).deleteWarningPopupInContext('user story', myBugs[index].userStoryTitle,context);
}

moveBugToNextPhasePressed(index, context) {
  myLastSelectedBug = index;
  myLastSelectedPhase = myBugs[index].phase;
  int myCurrentPhase = int.parse(myBugs[index].phase);
  if (myCurrentPhase < 3) {
    myCurrentPhase += 1;
    myBugs[myLastSelectedBug].phase = myCurrentPhase.toString();
  }
  MyLoggedInPage.of(context).moveBugToNextPhaseInContext();
}

changeBugPriorityUsingSlider(index, newValue, context) {
  myLastSelectedBug = index;
  myBugs[myLastSelectedBug].priority = newValue;
  MyLoggedInPage.of(context).changeBugPriorityUsingSliderInContext();
}
