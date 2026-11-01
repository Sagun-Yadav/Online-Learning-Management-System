
package com.lms.model;

public class Course {

    private int courseId;
    private String courseName;
    private String description;
    private String instructor;

    // Constructor
    public Course(int courseId, String courseName,
                  String description, String instructor) {

        this.courseId = courseId;
        this.courseName = courseName;
        this.description = description;
        this.instructor = instructor;
    }

    // Getters

    public int getCourseId() {
        return courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getDescription() {
        return description;
    }

    public String getInstructor() {
        return instructor;
    }
}
