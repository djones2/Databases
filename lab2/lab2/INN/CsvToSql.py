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
        for row in readCSV:
            if row[2]:
                row[2] = "STR_TO_DATE("+row[2]+", '%d-%M-%y')"
            if row[3]:
                row[3] = "STR_TO_DATE("+row[3]+", '%d-%M-%y')"
            sqlFile.write("INSERT INTO %s (" % sqlName + ', '.join(key) + ") \n    VALUES (" + ', '.join(row) + ");\n")

    sqlFile.close()

if __name__ == "__main__":
    main()