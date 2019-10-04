import sys

# Student Class to hold each student's data

class Student:
    def __init__(self, student_data):
        split_line = student_data.split(",")
        if (len(split_line) != 6) or not(is_int(split_line[2])) or not(is_int(split_line[3])) or not(is_int(split_line[4])) or (not(is_int(split_line[5])) and not(is_float(split_line[5]))):
            self.error = True
        else:
            self.error = False
            self.firstName = split_line[1]
            self.lastName = split_line[0]
            self.studentGrade = int(split_line[2])
            self.classroomNum = int(split_line[3])
            self.busRouteNum = int(split_line[4])
            self.studentGPA = float(split_line[5])
        
    def __str__(self):
        return self.lastName + "," + self.firstName + "," + str(self.studentGrade) + "," + str(self.classroomNum) + "," + str(self.busRouteNum) + "," + str(self.studentGPA)

class Teacher:
    def __init__(self, teacher_data):
        split_line = teacher_data.split(",")
        if(len(split_line) != 3):
           self.error=True;
        else:
           self.error = False
           self.lastName = split_line[0]
           self.firstName = split_line[1]
           self.classroomNum = int(split_line[2])

    def __str(self):
        return self.lastName + "," + self.firstName + "," + str(self.classroomNum)


# Checker Functions

def is_float(value):
    try:
        float(value)
        return True
    except ValueError:
        return False 

def is_int(val):
    try:
        int(val)
        return True
    except ValueError:
        return False

def syntax_error(invalid_string):
    print("Error: Invalid Syntax")
    print(invalid_string)

def divide_by_zero_error():
    print("Error: No students in selected grade")

def data_format_error(student_index):
    print("Error: Student data at index " + str(student_index) + " not formatted correctly")

def missing_data_error():
    print("Error: Could not find students.txt")

# Command Line Functions

def print_help():
    print("Available Commands:")
    print("S[tudent]:  <lastname> [B[us]]")
    print("T[eacher]:  <lastname>")
    print("B[us]:  <number>")
    print("G[rade]:  <number> [H[igh]|L[ow]]")
    print("A[verage]:  <number>")
    print("I[nfo]")
    print("Q[uit]")

def find_teacher(command_line, students, teachers):
    if len(command_line) != 2:
        syntax_error("T[eacher]  <lastname>")
        return
    for teacher in teachers:
       if command_line[1] == teacherLastName:
          classroomNum = teacher.classroomNum
    for student in students:
        if command_line[1] == classroomNum:
            print(student.lastName + "," + student.firstName)
    return

def find_student(command_line, students, teachers):
    if len(command_line) < 3:
        bus_route = False
    if len(command_line) > 3 or len(command_line) < 2:
        syntax_error("S[tudent]:  <lastname> [B[us]]")
        return
    else:
        # Can this be bus_route = command_line[2][0]?
        if len(command_line) == 3:
            bus_route = command_line[2] == "Bus" or (command_line[2] == "B")
    for student in students:
        if command_line[1] == student.lastName:
            if bus_route:
                print(student.lastName + "," + student.firstName + "," + str(student.busRouteNum))
            else:
                for teacher in teachers:
                   if teacher.classroomNum == student.classroomNum:
                      tLastName = teacher.lastName
                      tFirstName = teacher.firstName
                print(student.lastName + "," + student.firstName + "," + str(student.studentGrade) + "," + str(student.classroomNum) + "," + str(tLastName) + "," + str(tFirstName))  
    return

def find_grade(command_line, students, teachers):
    low = False
    high = False
    if len(command_line) == 3:
        high_or_low = command_line[2]
        if high_or_low[0] == "H":
            high = True
        elif high_or_low[0] == "L":
            low = True
    else:
       for student in students:
          if int(command_line[1]) == student.studentGrade:
             print(student.lastName + "," + student.firstName)
       return
    if low:
        lowest_grade = 5
        lowest_grade_student = students[0] 
        for student in students:
            if int(command_line[1]) == student.studentGrade and (student.studentGPA < lowest_grade):
                lowest_grade_student = student
                lowest_grade = student.studentGPA
        if lowest_grade != 5:
            for teacher in teachers:
                if teacher.classroomNum == lowest_grade_student.classroomNum:
                    tLastName = teacher.lastName
                    tFirstName = teacher.firstName
            print(lowest_grade_student.lastName + "," + lowest_grade_student.firstName + "," + str(lowest_grade_student.studentGPA) + "," + tLastName + "," + tFirstName + "," + str(lowest_grade_student.busRouteNum))
    else:
       highest_grade = 0
       highest_grade_student = students[0]
       for student in students:
           if int(command_line[1]) == student.studentGrade and (student.studentGPA > highest_grade):
               highest_grade_student = student
               highest_grade = student.studentGPA
       if highest_grade != 0:
           for teacher in teachers:
               if teacher.classroomNum == highest_grade_student.classroomNum:
                   tLastName = teacher.lastName
                   tFirstName = teacher.firstName
           print(highest_grade_student.lastName + "," + highest_grade_student.firstName + "," + str(highest_grade_student.studentGPA) + "," + str(tLastName) + "," + str(tFirstName) + "," + str(highest_grade_student.busRouteNum))
    return

def find_average(command_line, students):
    count = 0
    sum = 0
    if len(command_line) < 2 or not is_int(command_line[1]):
        syntax_error("A[verage]:  <grade>")
        return
    for student in students:
        if int(command_line[1]) == student.studentGrade:
            count += 1 
            sum += student.studentGPA
    if count == 0:
            return
    print(command_line[1] + "," + str(float(sum)/count))
    return

def find_bus(command_line, students):
    if len(command_line) != 2 or not is_int(command_line[1]):
        syntax_error("B[us]:  <route number>")
        return
    for student in students:
        if int(command_line[1]) == student.busRouteNum:
            print(student.lastName + "," + student.firstName + "," + str(student.studentGrade) + "," + str(student.classroomNum))
    return

def print_info(command_line, students):
    student_grades = [0 for n in range(0, 7)]
    for student in students:
        student_grades[student.studentGrade] += 1
    for i in range(0, 7, 1):
        print(str(i) + ": " + str(student_grades[i]))
    return

# Command Functions

def start(running, students, teachers):
    command_line = raw_input(">").split()
    if len(command_line) < 1:
        print_help()
        return
    select = command_line[0]
    select = select.split(":")[0]
    if select[0] == "S":
        command = find_student(command_line, students, teachers)
        return command 
    elif select[0] == "T":
        command = find_teacher(command_line, students, teachers)
        return command 
    elif select[0] == "G":
        command = find_grade(command_line, students, teachers)
        return command 
    elif select[0] == "B":
        command = find_bus(command_line, students)
        return command 
    elif select[0] == "A":
        command = find_average(command_line, students)
        return command
    elif select[0] == "I":
        command = print_info(command_line, students)
        return command 
    elif select[0] == "Q":
        #print("Goodbye")
        sys.exit(0)
    else:
        print_help()
        return  

def get_data_students(input_text):
    all_student_data = []
    for i in range(0, len(input_text), 1):
        student_info = Student(input_text[i])
        if student_info.error:
            return [-1, i]
        all_student_data.append(student_info)
    return all_student_data

def get_data_teachers(input_text):
    all_teacher_data = []
    for i in range(0, len(input_text), 1):
        teacher_info = Teacher(input_text[i])
        if teacher_info.error:
            return [-1, i]
        all_teacher_data.append(teacher_info)
    return all_teacher_data

# Main Program 
if __name__ == "__main__":
    try:
        f_open = open("list.txt", "r")
    except FileNotFoundError:
        missing_data_error()
        sys.exit(1)
    try:
        f_open = open("teachers.txt", "r")
    except FileNotFoundError:
        missing_data_error()
        sys.exit(1)
    data = []
    for line in open("list.txt"):
       data.append(line.rstrip())
    students = get_data_students(data)
    if students[0] == -1:
        data_format_error(students[1])
        sys.exit(2)
    data = []
    for line in open("teachers.txt"):
       data.append(line.rstrip())
    teachers = get_data_teachers(data)
    if teachers[0] == -1:
        data_format_error(teachers[1])
        sys.exit(2)
    running = True
    print_help()
    while running:
        status = start(running, students, teachers)
        print("")
