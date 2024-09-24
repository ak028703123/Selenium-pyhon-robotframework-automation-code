import re
import math
from datetime import datetime
import os

def formatDate(stringDate):
    input_date = stringDate
    input_date = datetime.strptime(input_date, "%Y-%m-%d %H:%M:%S")
    output_format = "%m/%d/%Y"
    formatted_Date = input_date.strftime(output_format)
    return formatted_Date


def formatAuditStatus(stringStatus):
    input_str = stringStatus
    formatted_Status = re.sub(r'([A-Z])', r' \1', input_str)
    formatted_Status = formatted_Status.strip()
    return formatted_Status


def formatDateOfService(stringAdmitDate, stringDischargeDate):
    input_date1 = stringAdmitDate
    input_date2 = stringDischargeDate
    input_date1 = datetime.strptime(input_date1, "%Y-%m-%d %H:%M:%S")
    output_format = "%m/%d/%Y"
    formattedAdmitDate = input_date1.strftime(output_format)
    input_date2 = datetime.strptime(input_date2, "%Y-%m-%d %H:%M:%S")
    formattedDischargeDate = input_date2.strftime(output_format)
    formattedDateOFService = formattedAdmitDate + " - " + formattedDischargeDate
    return formattedDateOFService


def formatPatientName(strFirstName, strLastName):
    combinedPatientName = strFirstName + " " + strLastName
    words = combinedPatientName.split()
    capitalized_Patientname = [word.capitalize() for word in words]
    formatted_PatientName = " ".join(capitalized_Patientname)
    return formatted_PatientName



def format(strFirstName, strLastName):
    combinedPatientName = strFirstName +" " +strLastName
    words = combinedPatientName.split()
    capitalized_Patientname = [word.capitalize() for word in words]
    formatted_PatientName = " ".join(capitalized_Patientname)
    return formatted_PatientName

####VJ
def formatSubscriberID(stringSubscriberID):
    formatted_SubscriberID = "00" + stringSubscriberID
    return formatted_SubscriberID


def formatToCurrency(numberstring):
    currency_string = "${:,.2f}".format(numberstring)
    return currency_string


def formatToCurrency(CurrencyStr):
    number = float(CurrencyStr)
    currency_string = "${:,.2f}".format(number)
    return currency_string


def VerifyIfNull(ReceivedData):
    if ReceivedData == "NULL":
        AssignValue = "N/A"
    else:
        AssignValue = ReceivedData

    return AssignValue


def formatProviderNumber(my_string):
    if my_string[0].isalpha():
        print("The string starts with an alphabet character. No need to add leading zeros.")
    else:

        if len(my_string) == 9:
            print("The string already has 9 characters.")
        elif len(my_string) < 9:

            my_string = my_string.zfill(9)

    return  my_string



def formatDateIfNotNull(stringDate):
    if stringDate == "":
        formatted_Date = ""
    else:
        input_date = stringDate
        input_date = datetime.strptime(input_date, "%m/%d/%Y %I:%M:%S %p")
        output_format = "%m/%d/%Y"
        formatted_Date = input_date.strftime(output_format)

    return formatted_Date


def ConvertCaseOftheString(stringName):
    CaseConvertedString = stringName.title()

    return CaseConvertedString


def FindDateDifference(stringDate):
    today_str = datetime.now().strftime("%m/%d/%Y")

    past_date = datetime.strptime(stringDate, "%m/%d/%Y")
    today_date = datetime.strptime(today_str, "%m/%d/%Y")

    date_difference = today_date - past_date

    days_difference = date_difference.days

    return days_difference


def FormatProviderName(StringProvidername):
    if not StringProvidername:
        return ''

    formatted_ProviderName = StringProvidername.replace(" ", "")

    formatted_ProviderName = formatted_ProviderName.replace("info", "")

    formatted_ProviderName = formatted_ProviderName.replace("\n", "")

    return formatted_ProviderName


def FormatCurrency(value):
    return '${:,.2f}'.format(float(value))


def truncate_trailing_zeros(currency):

    currency_parts = currency.split('.')
    if len(currency_parts) == 2:
        integer_part, decimal_part = currency_parts
        decimal_part = decimal_part.rstrip('0')
        result = f'{integer_part}.{decimal_part}' if decimal_part else integer_part
    else:
        result = currency

    return result


def multiply_by_015(input_value):
    try:

        number = float(input_value)
        result = round(number * 0.15, 2)

        return result
    except ValueError:

        return "Invalid input: Could not convert to a number"

def FormatPrepay(Option):

    string_without_quotes = Option.replace("'", "")


    return string_without_quotes


def getSystemPath():
    path = os.getcwd().lstrip()
    return  path


def getCurrentDateAndTime():
    currentDateAndTime = datetime.now().strftime("%m%d%Y%I%M%S")
    if (int(datetime.now().strftime("%I"))<10):
        modifiedtime = currentDateAndTime[:8] + currentDateAndTime[8+1:]
        return modifiedtime
    else:
        return currentDateAndTime

def getStringAfterRemovingSpaces(stringToFormat):

    formattedString = stringToFormat.strip()
    return formattedString

def formatDiagnosisCode(stringToFormat):
    formattedDiagnosisCode1 = ','.join(stringToFormat.splitlines())
    formattedDiagnosisCode2 = formattedDiagnosisCode1.replace("  ,", " ,").strip()
    return formattedDiagnosisCode2

def capitalizeWord(stringToCapaitalize):
    words = stringToCapaitalize.split()
    capitalized_Patientname = [word.capitalize() for word in words]
    formatted_word = " ".join(capitalized_Patientname)
    return formatted_word

def formatDateWithFloat(stringDateWithFloat):
    input_date = stringDateWithFloat
    input_date = datetime.strptime(input_date, "%Y-%m-%d %H:%M:%S.%f")
    output_format = "%m/%d/%Y"
    formatted_Date = input_date.strftime(output_format)
    return formatted_Date


def split_by_capital(stringWithoutSpace):
    # Split the text based on capital letters
    words = re.findall('[A-Z][^A-Z]*', stringWithoutSpace)
    # Join the words with a space
    return ' '.join(words)

