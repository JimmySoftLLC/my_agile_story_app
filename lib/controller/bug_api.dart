import 'package:http/http.dart' as http;
import 'dart:convert';
import 'project.dart';
import 'user_story.dart';
import 'bug.dart';
import 'error.dart';
import 'package:flutter/material.dart';
import 'package:my_agile_story_flutter_app/view/logged_in_page.dart';
import 'package:my_agile_story_flutter_app/view/messages.dart';
import 'package:my_agile_story_flutter_app/controller/debug_printing.dart';
import 'url_path_api.dart';

void getBugs(thisProject, context) async {
  var url = URL_Address + '/get/bugs';
  var body = json.encode({
    'bugIds': thisProject.bugIds,
  });
  Map<String,String> headers = {
    'Content-type' : 'application/json',
    'Accept': 'application/json, text/plain, */*',
    'x-auth-token': myToken,
  };
  http.Response response = await http.post(url, body: body, headers: headers);
  if (response.statusCode == 200) {
    var jsonDecodedData = json.decode(response.body);
    myBugs =[];
    for (int i = 0; i < jsonDecodedData.length; i++) {
      myBugs.add(new Bug.fromJson(jsonDecodedData[i])) ;
    }
    myBugs.sort((obj1, obj2) {return obj1.priority - obj2.priority;});
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MyLoggedInPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    }
    Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> PageRouteBuilder) => false);
  } else {
    myApiError = new ApiError.fromJson(json.decode(response.body));
    messagePopup('Error!',Colors.red,myApiError.error,context);
  }
}

void createNewBug(thisProject,thisBug,context) async {
  var url = URL_Address + '/project/bug/returnBugAndProject';
  var body = json.encode({
    'bugTitle': thisBug.bugTitle,
    'summary': thisBug.summary,
    'stepsToReproduce': thisBug.stepsToReproduce,
    'expectedResults': thisBug.expectedResults,
    'actualResults': thisBug.actualResults,
    'resolution': thisBug.resolution,
    'acceptanceCriteria': thisBug.acceptanceCriteria,
    'estimate': thisBug.estimate,
    'phase': thisBug.phase,
    'percentDone': thisBug.percentDone,
    'priority': thisBug.priority,
    'sprint': thisBug.sprint,
    'projectId': thisProject.id,
  });
  debugPrint(body);
  Map<String,String> headers = {
    'Content-type' : 'application/json',
    'Accept': 'application/json, text/plain, */*',
    'x-auth-token': myToken,
  };
  http.Response response = await http.post(url, body: body, headers: headers);
  if (response.statusCode == 200) {
    var jsonDecodedData = json.decode(response.body);
    thisBug = new Bug.fromJsonNested(jsonDecodedData);
    myProjects[myLastSelectedProject] = new Project.fromJsonNested(jsonDecodedData);
    getBugs(myProjects[myLastSelectedProject],context);
  } else {
    myApiError = new ApiError.fromJson(json.decode(response.body));
    messagePopup('Error!',Colors.red,myApiError.error,context);
  }
}

void updateBug(thisProject,thisBug,context) async {
  var url = URL_Address + '/put/userStory/returnBugAndProject';
  var body = json.encode({
    'userStoryId': thisBug.id,
    'userStoryTitle': thisBug.userStoryTitle,
    'userRole': thisBug.userRole,
    'userWant': thisBug.userWant,
    'userBenefit': thisBug.userBenefit,
    'acceptanceCriteria': thisBug.acceptanceCriteria,
    'conversation': thisBug.conversation,
    'estimate': thisBug.estimate,
    'phase': thisBug.phase,
    'percentDone': thisBug.percentDone,
    'priority': thisBug.priority,
    'sprint': thisBug.sprint,
    'projectId': thisProject.id,
    'developers': thisBug.developers
  });
  Map<String,String> headers = {
    'Content-type' : 'application/json',
    'Accept': 'application/json, text/plain, */*',
    'x-auth-token': myToken,
  };
  http.Response response = await http.post(url, body: body, headers: headers);
  if (response.statusCode == 200) {
    var jsonDecodedData = json.decode(response.body);
    thisBug = new Bug.fromJsonNested(jsonDecodedData);
    myProjects[myLastSelectedProject] = new Project.fromJsonNested(jsonDecodedData);
    getBugs(myProjects[myLastSelectedProject],context);
  } else {
    myApiError = new ApiError.fromJson(json.decode(response.body));
    messagePopup('Error!',Colors.red,myApiError.error,context);
  }
}

void deleteBug(myBugIndex, context) async {
  if (myBugIndex != -1 && myBugs.length > 0) {
    messagePopupNoDismiss('',Colors.black,'Deleting user story please wait',context);
    var userStoryId = myBugs[myBugIndex].id;
    var projectId = myBugs[myBugIndex].projectId;
    var myProjectIndex = -1;
    for (int i = 0; i < myProjects.length; i++) {
      if (myProjects[i].id == projectId) {
        myProjectIndex = i;
        break;
      }
    }
    var url = URL_Address + '/delete/project/userStory';
    var body = json.encode({
      'userStoryId': userStoryId,
      'projectId': projectId
    });
    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json, text/plain, */*',
      'x-auth-token': myToken,
    };
    http.Response response = await http.post(url, body: body, headers: headers);
    if (response.statusCode == 200) {
      var jsonDecodedData = json.decode(response.body);
      myProjects[myProjectIndex] = new Project.fromJson(jsonDecodedData);
      getBugs(myProjects[myProjectIndex],context);
    } else {
      myApiError = new ApiError.fromJson(json.decode(response.body));
      messagePopup('Error!',Colors.red,myApiError.error,context);
    }
  }
}