
RAW_DATA_DIRECTORY = 'D:/DataForProjects/DCBikeShare/RawData/';
PROCESSED_DATA_DIRECTORY = 'D:/DataForProjects/DCBikeShare/ProcessedData/';
STATION_LOCATIONS_SOURCE = 'D:/DataForProjects/DCBikeShare/Capital_Bike_Share_Locations_Dictionary.txt';
SQL_SCRIPT_DIRECTORY = 'C:/Users/nitin/Documents/Projects/DCBikeShare/SQLScripts/'

list_of_files_format1 = [
'2010-Q4-cabi-trip-history-data.csv',
'2011-Q1-cabi-trip-history-data.csv',
'2011-Q2-cabi-trip-history-data.csv',
'2011-Q3-cabi-trip-history-data.csv',
'2011-Q4-cabi-trip-history-data.csv']

list_of_files_format2 = [
'2012-Q1-cabi-trip-history-data.csv',
'2012-Q2-cabi-trip-history-data.csv',
'2012-Q3-cabi-trip-history-data.csv',
'2012-Q4-cabi-trip-history-data.csv',
'2013-Q1-cabi-trip-history-data.csv',
'2013-Q2-cabi-trip-history-data.csv',
'2013-Q3-cabi-trip-history-data.csv']

list_of_files_format3 = [
'2013-Q4-cabi-trip-history-data.csv',
'2014-Q1-cabi-trip-history-data.csv',
'2014-Q2-cabi-trip-history-data.csv',
'2014-Q3-cabi-trip-history-data.csv',
'2014-Q4-cabi-trip-history-data.csv',
'2015-Q1-Trips-History-Data.csv',
'2015-Q2-Trips-History-Data.csv']

list_of_files_format4 = [
'2015-Q3-cabi-trip-history-data.csv',
'2015-Q4-Trips-History-Data.csv',
'2016-Q1-Trips-History-Data.csv',
'2016-Q2-Trips-History-Data.csv',
'2016-Q3-Trips-History-Data.csv',
'2016-Q4-Trips-History-Data.csv'];



def getNewDataDestination(filename):
	datadest = open (PROCESSED_DATA_DIRECTORY + filename[0:7] + '.csv', 'w');
	return datadest;


def getStationIdDictionary():
	stations = open(STATION_LOCATIONS_SOURCE, 'r').readlines()[1:];
	stationDictionary = dict();
	for line in stations:
		cells = line.split(',');
		stationDictionary[cells[1]] = cells[0];
	return stationDictionary;
StationIdDictionary = getStationIdDictionary();


def writeDataToDestinationFormat1(cells, datadest, lineCount):
	try: # essential data manipulation for data
		cells[3] = str(int(cells[3][-6:-1]));
		cells[4] = str(int(cells[4][-6:-1]));
		cells[6] = cells[6].strip();
		cells[5] = cells[5] if cells[5][0]=='W' else 'NA'
		datadest.write(','.join(cells) + '\n');
		return True;
	except:
		return False;

def writeDataToDestinationFormat2(cells, datadest, lineCount):
	try: # essential data manipulation for data
		try:
			cells[3] = StationIdDictionary[cells[3].strip()]
			cells[4] = StationIdDictionary[cells[4].strip()]
		except:
			pass
		cells[6] = cells[6].strip();
		cells[5] = cells[5] if cells[5][0]=='W' else 'NA'
		datadest.write(','.join(cells) + '\n');
		return True;
	except:
		return False;
		
def writeDataToDestinationFormat3(cells, datadest, lineCount):
	try: # essential data manipulation for data
		try:
			cells[2] = StationIdDictionary[cells[2].strip()]
			cells[4] = StationIdDictionary[cells[4].strip()]
		except:
			pass
		cells[6] = cells[6].strip();
		cells[5] = cells[5] if cells[5][0]=='W' else 'NA'
		temp = cells[2];
		cells[2] = cells[3];
		cells[3] = temp;
		datadest.write(','.join(cells) +'\n');
		return True;
	except:
		return False;

def writeDataToDestinationFormat4(cells, datadest, lineCount):
	try: # essential data manipulation for data
		cells[7] = cells[7] if cells[7][0]=='W' else 'NA'
		cells2 = [cells[0], cells[1], cells[2], str(int(cells[3])), str(int(cells[5])), cells[7], cells[8]]
		datadest.write(','.join(cells2) + '\n');
		return True;
	except:
		return False;
		
def processFilesInList(list_of_files, dataWriteFunction):
	for file in list_of_files:
		datasrc = open(RAW_DATA_DIRECTORY + file, 'r');
		dataDestination = getNewDataDestination(file);
		totalSuccessLines = 0; totalLineCount = 0;
		for line in datasrc:
			totalLineCount+=1;
			cells = line.strip().split(',');
			totalSuccessLines += 1 if dataWriteFunction(cells, dataDestination, totalSuccessLines+1) else 0;
		dataDestination.close();
		print '{totalLineCount} lines of {file} read. {totalSuccessLines} written.'.format(totalLineCount = totalLineCount, file = file, totalSuccessLines = totalSuccessLines);

def writeSQLScriptToLoadData():
	datadest = open(SQL_SCRIPT_DIRECTORY + 'loadingDataScript.sql', 'w');
	concat_list_of_files = list_of_files_format1 + list_of_files_format2 + list_of_files_format3 + list_of_files_format4;

	for file in concat_list_of_files:
		query = '''
		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/{}'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);'''.format(file[0:7]+'.csv');
		
		datadest.write(query);
		datadest.write('\n');
	
	datadest.close();
	
processFilesInList(list_of_files_format3, writeDataToDestinationFormat3);
processFilesInList(list_of_files_format4, writeDataToDestinationFormat4);
