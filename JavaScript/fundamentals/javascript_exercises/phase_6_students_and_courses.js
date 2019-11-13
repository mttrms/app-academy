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

function Course(name, department, credits) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = [];
}

Course.prototype.addStudent = function (student) {
  student.enroll(this);
}
