import csv
import os

file_path = os.getcwd()+"\\TestData\\UI\\RecoveryStudio\\database_data.csv"


def read_csv_file():
 data_list = []
 with open(file_path, 'r', newline='') as csv_file:
     csv_reader = csv.DictReader(csv_file)
     for row in csv_reader:
       data_list.append(row)
       print(data_list)
     return data_list


def readTheAppealFindingsData():
    auditFindingsDataList=[]
    with open(file_path, 'r', newline='') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        for row in csv_reader:
            row.keys()









