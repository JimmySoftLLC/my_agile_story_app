class Bug {
  String id;
  String bugTitle;
  String summary;
  String stepsToReproduce;
  String expectedResults;
  String actualResults;
  String resolution;
  String acceptanceCriteria;
  int estimate;
  String phase;
  int percentDone;
  int priority;
  int sprint;
  String projectId;
  List<dynamic> votes;
  List<dynamic> developers;
  String timeStampISO;

  Bug (id,bugTitle,summary,stepsToReproduce,expectedResults,actualResults,resolution,acceptanceCriteria,estimate,phase,percentDone,priority,sprint,projectId) {
    this.id = id;
    this.bugTitle = bugTitle;
    this.summary = summary;
    this.stepsToReproduce = stepsToReproduce;
    this.expectedResults = expectedResults;
    this.actualResults = actualResults;
    this.resolution = resolution;
    this.acceptanceCriteria = acceptanceCriteria;
    this.estimate = estimate;
    this.phase = phase;
    this.percentDone = percentDone;
    this.priority = priority;
    this.sprint = sprint;
    this.projectId = projectId;
  }

  Bug.fromJson(Map json) {
    this.id = json['_id'];
    this.bugTitle = json['bugTitle'];
    this.summary = json['summary'];
    this.stepsToReproduce = json['stepsToReproduce'];
    this.expectedResults = json['expectedResults'];
    this.actualResults = json['actualResults'];
    this.resolution = json['resolution'];
    this.acceptanceCriteria = json['acceptanceCriteria'];
    this.estimate = json['estimate'];
    this.phase = json['phase'];
    this.percentDone = json['percentDone'];
    this.priority = json['priority'];
    this.sprint = json['sprint'];
    this.projectId = json['projectId'];
    this.votes = json['votes'];
    this.developers = json['developers'];
    this.timeStampISO = json['timeStampISO'];
  }

  Bug.fromJsonNested(Map json) {
    this.id = json['bug']['_id'];
    this.bugTitle = json['bug']['bugTitle'];
    this.summary = json['bug']['summary'];
    this.stepsToReproduce = json['bug']['stepsToReproduce'];
    this.expectedResults = json['bug']['expectedResults'];
    this.actualResults = json['bug']['actualResults'];
    this.resolution = json['bug']['resolution'];
    this.acceptanceCriteria = json['bug']['acceptanceCriteria'];
    this.estimate = json['bug']['estimate'];
    this.phase = json['bug']['phase'];
    this.percentDone = json['bug']['percentDone'];
    this.priority = json['bug']['priority'];
    this.sprint = json['bug']['sprint'];
    this.projectId = json['bug']['projectId'];
    this.votes = json['bug']['votes'];
    this.developers = json['bug']['developers'];
    this.timeStampISO = json['bug']['timeStampISO'];
  }
}

var myBugs = [];