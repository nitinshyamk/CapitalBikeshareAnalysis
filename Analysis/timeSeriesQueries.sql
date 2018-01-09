SELECT * FROM cbikeshare.rides LIMIT 10;

-- monthly time series
SELECT 
    COUNT(*) AS tripCount, month(r.startTime) as startMonth, s.address
FROM
    cbikeshare.rides AS r
        INNER JOIN
    cbikeshare.stations AS s ON r.startStation = s.stationId
GROUP BY r.startStation, startMonth
ORDER BY startMonth ASC, tripCount DESC;

-- get the most common trips
SELECT 
    COUNT(*) AS tripCount,
    AVG(r.endTime - r.startTime) AS averageTripTime,
    s.address AS startAddress,
    t.address AS endAddress
FROM
    cbikeshare.rides AS r
        INNER JOIN
    cbikeshare.stations AS s ON r.startStation = s.stationId
        INNER JOIN
    cbikeshare.stations AS t ON r.endStation = t.stationId
GROUP BY startStation , endStation
ORDER BY tripCount DESC;

-- statement below obtains trip length distributions by month - hypothesis is that trip lengths get longer in summer
SELECT a.tripLength, sum(a.tripCount) as tripCount, startMonth
FROM
    (SELECT MINUTE(t.tripLength) + HOUR(t.tripLength) * 60 AS tripLength,
			t.startMonth as startMonth,
            COUNT(*) AS tripCount
		FROM
			(SELECT TIMEDIFF(endTime, startTime) as tripLength, monthname(startTime) as startMonth
			FROM cbikeshare.rides) AS t
    GROUP BY tripLength, startMonth
    ORDER BY tripLength) AS a
WHERE
    a.tripLength <= 180 and a.tripLength > 0
GROUP BY a.startMonth, a.tripLength;

 -- get all triplengths for trips less than four hours
SELECT MINUTE(t.tripLength) + HOUR(t.tripLength) * 60 AS tripLength,
			t.startMonth as startMonth
	FROM
			(SELECT TIMEDIFF(endTime, startTime) as tripLength, monthname(startTime) as startMonth
			FROM cbikeshare.rides) as t;
            
-- get hourly time series 
SELECT 
    (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime) AS hours_since_junefirst,
    COUNT(*) AS trip_count
FROM
    cbikeshare.rides
WHERE
    MONTH(startTime) < 9
        AND MONTH(startTime) > 5
GROUP BY (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime)
ORDER BY (DAYOFYEAR(startTime) - 152) * 24 + HOUR(startTime);

-- get average weekly time series
SELECT r.startDayOfWeek, r.startHour, COUNT(*) FROM (SELECT 
    DAYOFWEEK(rides.startTime) AS startDayOfWeek,
    HOUR(rides.startTime) AS startHour
FROM
	cbikeshare.rides
WHERE MONTH(startTime) > 5 AND MONTH(startTime) < 9) AS r
GROUP BY r.startDayOfWeek, r.startHour
ORDER BY r.startDayOfWeek, r.startHour