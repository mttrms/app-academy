function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.courses = [];
}

Student.prototype.name = function () {
  return `${this.firstName} ${this.lastName}`
}

Student.prototype.enroll = function (course) {
  if (this.courses.includes(course)) {
    return 'Already enrolled.'
  } else {
    this.courses.push(course);
    course.students.push(this);
  }
}

Student.prototype.courseLoad = function () {
  courseLoad = {};

  this.courses.forEach(function (course) {
    if (courseLoad[course.department] === undefined) {
      courseLoad[course.department] = course.credits;
    } else {
      courseLoad[course.department] = courseLoad[course.department] + course.credits;
    }
  })

  return courseLoad;
}

function Course(name, department, credits, schedule) {
  this.name = name;
  this.department = department;
  this.schedule = schedule;
  this.credits = credits;
  this.students = [];
}

Course.prototype.addStudent = function (student) {
  student.enroll(this);
}

Course.prototype.conflictsWith = function (otherCourse) {
  courseTime = this.schedule.time;

  for (let i = 0; i < this.schedule.days.length; i++) {
    courseDay = this.schedule.days[i];

    if (otherCourse.schedule.days.includes(courseDay) && otherCourse.schedule.time === courseTime) {
      return true;
    }
  }

  return false;
}
