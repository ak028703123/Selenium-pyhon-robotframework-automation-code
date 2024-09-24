import pandas as pd

def readFromExcel(fileName):

    dataframe = pd.read_excel(fileName)
    data_list = dataframe.to_dict("records")
    return data_list













