		LOAD DATA LOCAL INFILE 'D:/DataForProjects/DCBikeShare/Capital_Bike_Share_Locations.csv'
		INTO TABLE cbikeshare.stations
			CHARACTER SET 'utf8'
			FIELDS TERMINATED BY ','
			(@stationIdString, @address, @latitude, @longitude, @docknumber)
		SET stationId = @stationIdString,
			address = @address,
			latitude = @latitude,
			longitude = @longitude,
			numberOfDocks = @docknumber;
            
		select * from cbikeshare.stations;
        delete from cbikeshare.stations where stationId = 0;
        select * from cbikeshare.stations where stationId = 0;