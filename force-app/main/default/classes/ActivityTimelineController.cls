public class ActivityTimelineController {
  @AuraEnabled(cacheable=true)
  public static List<Task> getActivities(Id recordId) {
    return [
      SELECT Subject, Description, ActivityDate
      FROM Task
      WHERE WhatId = :recordId
      ORDER BY ActivityDate DESC
    ];
  }
}