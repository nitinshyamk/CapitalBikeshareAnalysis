library(DBI)
library(RMySQL)
library(ggplot2)

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
                                      MONTH(startTime) < 11
                                      AND MONTH(startTime) > 3
                                      GROUP BY (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime)
                                      ORDER BY (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime);"), n=-1)
  dbClearResult(dbListResults(con)[[1]])
  dbDisconnect(con);
  return(timeSeriesOfTripCounts);
};

generateAggregatedWeekTimeSeriesOfTripCountsAcrossAllStations <- function() {
  con <- dbConnect(MySQL(), user="webapp", password="webapp", dbname="cbikeshare", host="localhost");
  timeSeriesOfTripCounts <- fetch(dbSendQuery(con, "SELECT 
    r.startDayOfWeek, r.startHour, COUNT(*) as tripCount
                                              FROM
                                              (SELECT 
                                              DAYOFWEEK(rides.startTime) AS startDayOfWeek,
                                              HOUR(rides.startTime) AS startHour
                                              FROM
                                              cbikeshare.rides
                                              WHERE
                                              MONTH(startTime) > 5
                                              AND MONTH(startTime) < 9) AS r
                                              GROUP BY r.startDayOfWeek , r.startHour
                                              ORDER BY r.startDayOfWeek , r.startHour;"), n=-1)
  dbClearResult(dbListResults(con)[[1]])
  dbDisconnect(con);
  return(timeSeriesOfTripCounts);
};

# assumes data in format of retrieval by generateTimeSeriesOfTripCountsAcrossAllStations
generateAutocorrelationPlotFromTimeSeriesData <- function(timeseries, maxlag) {
  autocorrelation <- data.frame(0:maxlag, 0:maxlag);
  colnames(autocorrelation) <- c("lag", "cor")
  for (h in 0:maxlag) { #3 weeks if units are hours
    autocorrelation$cor[h+1] <- cor(timeseries[1:1465, 2], timeseries[(h+1):(1464+h+1), 2]);
  }
  return(autocorrelation)
}

generateDayAutocorrelationPlotFromTimeSeriesData <- function(timeseries, maxlag) {
  autocorrelation <- data.frame((0:maxlag), 0:maxlag);
  colnames(autocorrelation) <- c("lag", "cor")
  for (h in 0:maxlag) { #3 weeks if units are hours
    autocorrelation$cor[h+1] <- cor(timeseries[1:1465, 2], timeseries[(h*24+1):(1464+h*24+1), 2]);
  }
  return(autocorrelation)
}

triplengthdata <- generateTripLengthDistributionsByMonth();
ggplot(data = triplengthdata, mapping = aes(trip_length, color = start_month)) + geom_density();

trip_time_series <- generateTimeSeriesOfTripCountsAcrossAllStations()
ggplot(data = trip_time_series[0:720,], mapping = aes(x=hours_since_junefirst, y=trip_count)) + geom_point(alpha = 0.3) + geom_line()


autocorrelation <- generateAutocorrelationPlotFromTimeSeriesData(trip_time_series, 240)
ggplot(data = autocorrelation, mapping = aes(x=lag, y=cor)) + geom_point(alpha = 0.3) + geom_line() + geom_vline(xintercept=24*(0:10), color='blue') + geom_vline(xintercept = 24*7*(0:1), color='orange')


autocorrelationDay <- generateDayAutocorrelationPlotFromTimeSeriesData(trip_time_series, 60)
ggplot(data = autocorrelationDay, mapping = aes(x=lag, y=cor)) + geom_point(alpha = 0.3) + geom_line() + geom_vline(xintercept = 7*(0:2), color='orange')


