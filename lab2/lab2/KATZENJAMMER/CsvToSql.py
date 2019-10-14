import sys
import csv

def main():
    if len(sys.argv) != 3:
        print "Usage: python csvToSql.py <csv input file name> <sql output file name>\n **No filename Extensions**"
    csvName = sys.argv[1]
    sqlName = sys.argv[2]
    sqlFile = open("%s.sql" % sqlName, "w")

    with open('%s.csv' % csvName) as csvfile:
        readCSV = csv.reader(csvfile, delimiter=',')
        key = next(readCSV)
        i = 0
        for item in key:
            temp = key[i]
            temp = temp[1:-1]
            key[i] = temp
            i = i + 1
        print(key)
        for row in readCSV:
            sqlFile.write("INSERT INTO %s (" % sqlName + ', '.join(key) + ") \n    VALUES (" + ', '.join(row) + ");\n")

    sqlFile.close()

if __name__ == "__main__":
    main()