import pyodbc
import csv
import os

####Connecting to Db, executing a query and writing the results to CSV file
def readTheDataFromDB(sqlQuery):
    file_name = os.getcwd() + "\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    if os.path.exists(file_name):
        os.remove(file_name)
    connection = pyodbc.connect(
        'DRIVER={SQL SERVER};'
        'SERVER=CLETDBSQL01\BlueApp002;'
        'DATABASE=GATEW_ProviderPortal;'
        'UID=caswebuser;'
        'PWD=Moneyhungry$;'
    )
    cursor = connection.cursor()
    queryToExecute = sqlQuery
    cursor.execute(queryToExecute)
    file_name = os.getcwd()+"\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    header = [column[0] for column in cursor.description]
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for row in cursor:
            writer.writerow(row)
    cursor.close()
    return 'null'


def readTheDataFromDBusingTablenumber(sqlQuery,TableNumber):
    connection = pyodbc.connect(
        'DRIVER={SQL SERVER};'
        'SERVER=CLETDBSQL01\BlueApp002;'
        'DATABASE=GATEW_ProviderPortal;'
        'UID=caswebuser;'
        'PWD=Moneyhungry$;'
    )
    cursor = connection.cursor()
    queryToExecute = sqlQuery
    cursor.execute(queryToExecute)
    file_name = os.getcwd()+"\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file)
        cnt = 1

        while cnt < int(TableNumber):
            cursor.nextset()
            cnt = cnt + 1
        header = [column[0] for column in cursor.description]
        writer.writerow(header)
        for row in cursor.fetchall():
            writer.writerow(row)
    cursor.close()
    return 'null'

def readTheDataFromDBAccordingToDB(dbName, sqlQuery):
    file_name = os.getcwd() + "\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    databaseName = dbName
    if os.path.exists(file_name):
        os.remove(file_name)
    if(databaseName=='HMBCBS_ProviderPortal'):
         connection = pyodbc.connect(
        'DRIVER={SQL SERVER};'
        'SERVER=CLETDBSQL01\BlueApp002;'
        'DATABASE=HMBCBS_ProviderPortal;'
        'UID=caswebuser;'
        'PWD=Moneyhungry$;'
         )
    elif (databaseName == 'GATEW_ProviderPortal'):
        connection = pyodbc.connect(
            'DRIVER={SQL SERVER};'
            'SERVER=CLETDBSQL01\BlueApp002;'
            'DATABASE=GATEW_ProviderPortal;'
            'UID=caswebuser;'
            'PWD=Moneyhungry$;'
        )
    elif (databaseName == 'MSCOMM_ProviderPortal'):
        connection = pyodbc.connect(
            'DRIVER={SQL SERVER};'
            'SERVER=CLETDBSQL01\BlueApp002;'
            'DATABASE=MSCOMM_ProviderPortal;'
            'UID=caswebuser;'
            'PWD=Moneyhungry$;'
        )
    elif (databaseName == 'MSSTATE_ProviderPortal'):
        connection = pyodbc.connect(
            'DRIVER={SQL SERVER};'
            'SERVER=CLETDBSQL01\BlueApp002;'
            'DATABASE=MSSTATE_ProviderPortal;'
            'UID=caswebuser;'
            'PWD=Moneyhungry$;'
        )
    elif (databaseName == 'HMBCBS_CONF'):
        connection = pyodbc.connect(
            'DRIVER={SQL SERVER};'
            'SERVER=sql-pp-dev.database.windows.net;'
            'DATABASE=HMBCBS_CONF;'
            'UID=caswebuser;'
            'PWD=Moneyhungry$;'
        )

    cursor = connection.cursor()
    queryToExecute = sqlQuery
    cursor.execute(queryToExecute)
    file_name = os.getcwd()+"\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    header = [column[0] for column in cursor.description]
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for row in cursor:
            writer.writerow(row)
    cursor.close()
    return 'null'


def readTheDataFromDBAccordingToClientFromCASCAM(dbName, sqlQuery):
    file_name = os.getcwd() + "\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    databaseName = dbName
    if os.path.exists(file_name):
        os.remove(file_name)
    if(databaseName=='HMBCBS_CAS_CAM'):
         connection = pyodbc.connect(
        'DRIVER={SQL SERVER};'
        'SERVER=CLETDBSQL01\BlueApp002;'
        'DATABASE=HMBCBS_CAS_CAM;'
        'UID=caswebuser;'
        'PWD=Moneyhungry$;'
         )
    elif (databaseName == 'GATEW_CAS_CAM'):
        connection = pyodbc.connect(
            'DRIVER={SQL SERVER};'
            'SERVER=CLETDBSQL01\BlueApp002;'
            'DATABASE=GATEW_CAS_CAM;'
            'UID=caswebuser;'
            'PWD=Moneyhungry$;'
        )
    elif (databaseName == 'MSCOMM_CAS_CAM'):
        connection = pyodbc.connect(
            'DRIVER={SQL SERVER};'
            'SERVER=CLETDBSQL01\BlueApp002;'
            'DATABASE=MSCOMM_ProviderPortal;'
            'UID=caswebuser;'
            'PWD=Moneyhungry$;'
        )
    elif (databaseName == 'MSSTATE_CAS_CAM'):
        connection = pyodbc.connect(
            'DRIVER={SQL SERVER};'
            'SERVER=CLETDBSQL01\BlueApp002;'
            'DATABASE=MSSTATE_CAS_CAM;'
            'UID=caswebuser;'
            'PWD=Moneyhungry$;'
        )

    cursor = connection.cursor()
    queryToExecute = sqlQuery
    cursor.execute(queryToExecute)
    file_name = os.getcwd()+"\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    header = [column[0] for column in cursor.description]
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for row in cursor:
            writer.writerow(row)
    cursor.close()
    return 'null'


def readTheDataFromCloudDBAccordingToDB(dbName, sqlQuery):
    file_name = os.getcwd() + "\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    databaseName = dbName
    if os.path.exists(file_name):
        os.remove(file_name)
    if(databaseName=='HMBCBS_CONF'):
         connection = pyodbc.connect(
        'DRIVER={SQL SERVER};'
        'SERVER=sql-pp-qa.database.windows.net;'
        'DATABASE=HMBCBS_CONF;'
        'UID=caswebuser;'
        'PWD=MoneyhungryQA$;'
        # 'UID=deepika.dheeraj@cgi.com;'
        # 'PWD=Mypassword2016!'
         )

    cursor = connection.cursor()
    queryToExecute = sqlQuery
    cursor.execute(queryToExecute)
    file_name = os.getcwd()+"\\TestData\\UI\\RecoveryStudio\\database_data.csv"
    header = [column[0] for column in cursor.description]
    with open(file_name, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(header)
        for row in cursor:
            writer.writerow(row)
    cursor.close()
    return 'null'













