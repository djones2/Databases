import sys

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

def syntax_error(string):
    print("Error: Invalid Syntax")
    print(string)

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