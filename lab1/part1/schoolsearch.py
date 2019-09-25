import sys

# Student Class to 

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

# Check Functions

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
    print("Error: Could not locate students.txt")



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