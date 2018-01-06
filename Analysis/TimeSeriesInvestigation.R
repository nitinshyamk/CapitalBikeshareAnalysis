

# the following script will generate a plot for 

generateTripLengthDistributionsByMonth <- function() {
  con <- dbConnect(MySQL(), user="webapp", password="webapp", dbname="cbikeshare", host="localhost");
  triplengthdata <- fetch(dbSendQuery(con, "SELECT 
    MINUTE(t.tripLength) + HOUR(t.tripLength) * 60 AS trip_length, t.startMonth AS start_month
    FROM 
      (SELECT TIMEDIFF(endTime, startTime) AS tripLength, MONTHNAME(startTime) AS startMonth
        FROM cbikeshare.rides) as t
       WHERE MINUTE(t.tripLength) + HOUR(t.tripLength) * 60  < 60;"), n=-1)
  dbClearResult(dbListResults(con)[[1]])
  triplengthdata$start_month <- factor(triplengthdata$start_month,
                                    levels = c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'),
                                    ordered=TRUE);
  ggplot(data = triplengthdata, mapping = aes(trip_length, color = start_month)) + geom_density();
  dbDisconnect(con);
  return(triplengthdata);
};

generateTimeSeriesOfTripCountsAcrossAllStations <- function() {
  con <- dbConnect(MySQL(), user="webapp", password="webapp", dbname="cbikeshare", host="localhost");
  timeSeriesOfTripCounts <- fetch(dbSendQuery(con, "SELECT 
    (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime) AS hours_since_junefirst,
                                      COUNT(*) AS trip_count
                                      FROM
                                      cbikeshare.rides
                                      WHERE
                                      MONTH(startTime) < 9
                                      AND MONTH(startTime) > 6
                                      GROUP BY (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime)
                                      ORDER BY (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime);"), n=-1)
  dbClearResult(dbListResults(con)[[1]])
  dbDisconnect(con);
  return(timeSeriesOfTripCounts);
};

#requires t and y fields
generateAutocorrelationPlotFromTimeSeriesData <- function(timeseries) {
  for (h in 0:192) { #8 days if units are hours
    timeseries[]
  }
}

#triplengthdata <- generateTripLengthDistributionsByMonth();
trip_time_series <- generateTimeSeriesOfTripCountsAcrossAllStations()
