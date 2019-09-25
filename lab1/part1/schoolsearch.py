import sys

# Student Class to hold each student's data

class Student:
    def __init__(self, student_data):
        split_line = student_data.split(",")
        if not is_int(split_line[2]) or not is_int(split_line[3]) or not is_int(split_line[4]) or not is_float(split_line[5]) or not len(split_line) != 8:
            self.error = True
        else:
            self.error = False
            self.firstName = split_line[1]
            self.lastName = split_line[0]
            self.studentGrade = int(split_line[2])
            self.classroomNum = int(split_line[3])
            self.busRouteNum = int(split_line[4])
            self.studentGPA = float(split_line[5])
            self.teacherLastName = split_line[6]
            self.teacherFirstName = split_line[7]
        
    def __str__(self):
        return self.lastName + "," + self.firstName + "," + str(self.studentGrade) + "," + + str(self.classroomNum) + "," + str(self.busRouteNum) + "," + str(self.studentGPA) + "," + self.teacherLastName + "," + self.teacherLastName

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

def find_teacher(command_line, students):
    if len(command_line) != 2:
        syntax_error("T[eacher]  <lastname>")
        return
    for student in students:
        if command_line[1] == student.teacherLastName:
            

def find_student(command_line, students):
    if len(command_line) < 3:
        bus_route = False
    if len(command_line) > 3 or len(command_line) < 2:
        syntax_error("S[tudent]  <lastname> [B[us]]")
        return
    else:
        # Can this be bus_route = command_line[2][0]?
        bus_route = command_line[2] == "Bus" or (command_line[2] == "B")
    for student in students
        if command_line[1] == student.lastName:
            if bus_route:
                print(student.lastName + ", " + student.firstName + " " + str(student.busRouteNum))
            else:
                print(student.lastName + "," + student.lastName + " " + str(student.busRouteNum))  
    return 0


# Command Functions

def start(running, students):
    command_line = input(">").split()
    if(len(command_line) < 1):
        print_help()
        return 1
    select = command_line[0]
    select = select.split(":")[0]
    if select[0] == "S":
        command = find_student(command_line, students)
        return command 
    elif select[0] == "T":
        command = find_teacher(command_line, students)
        return command 
    elif select[0] == "G":
        command = find_grade(command_line, students)
        return command 
    elif select[0] == "B":
        command = find_bus(command_line, students)
        return command 
    elif select[0] == "A":
        command = find_average(command_line, students)
        return command
    elif select[0] == "I":
        command = find_info(command_line, students)
        return command 
    elif select[0] == "Q":
        print("Goodbye")
        exit
    else:
        print_help()
        return 1    

def get_data(input_text):
    all_student_data = []
    for i in range(0, len(input_text) - 1):
        student_info = Student(input_text[i])
        if student_info.error:
            return [-1, i]
        all_student_data.append(student_info)
    return all_student_data

# Main Program 
if __name__ == "__main__":
    try:
        f_open = open("students.txt", "r")
    except FileNotFoundError:
        missing_data_error()
        sys.exit(1)
    text = f_open.read()
    data = text.split("\n")
    students = get_data(data)
    if students[0] == -1:
        data_format_error(students[1])
        sys.exit(2)
    running = True
    while running:
        status = start(running, students)
        print("")