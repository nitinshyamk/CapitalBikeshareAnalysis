
		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2010-Q4.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2011-Q1.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2011-Q2.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2011-Q3.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2011-Q4.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2012-Q1.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2012-Q2.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2012-Q3.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2012-Q4.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2013-Q1.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2013-Q2.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2013-Q3.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2013-Q4.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2014-Q1.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2014-Q2.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2014-Q3.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2014-Q4.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%Y-%m-%d %H:%i'),
			endTime = str_to_date(@endTimeString, '%Y-%m-%d %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2015-Q1.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2015-Q2.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2015-Q3.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2015-Q4.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2016-Q1.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2016-Q2.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2016-Q3.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);

		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/ProcessedData/2016-Q4.csv'
		INTO TABLE cbikeshare.rides
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@duration, @startTimeString, @endTimeString, @startStationString, @endStationString, @bikeIdString, @rawMembershipType)
		SET startStation = @startStationString,
			endStation = @endStationString,
			startTime = str_to_date(@startTimeString, '%m/%d/%Y %H:%i'),
			endTime = str_to_date(@endTimeString, '%m/%d/%Y %H:%i'),
			bikeId = @bikeIdString,
			membershipType = trim(@rawMembershipType);
