INSERT INTO `bus_stations`.`route`
(`Route_code`,
`Source`,
`Destination`,
`Arrival`,
`Departure`,
`Status`,
`Duration`,
`Route_type`,
`Layover_Time`,
`No_of_Stops`,
`CompanyID`)
VALUES
'BB001', 'RIC', 'NYC', '15:00', '09:00', 'On-Time', '24hr', 'nonstop', '1', '1', 'BB'
'FB001', 'RIC', 'NEW', '14:00', '09:00', 'Late', '24hr', 'nonstop', '0', '0', 'FB'
'GH001', 'ATL', 'MIA', '09:30', '12:00', 'On-time', '24hr', 'Non-stop', '0', '0', 'GH'
'GH002', 'ATL', 'Tor', '03:30', '11:00', 'On-time', '24hr', 'Connecting', '2', '1', 'GH'
'MB001', 'DET', 'BOS', '19:00', '08:00', 'Late', '24hr', 'nonstop', '0', '0', 'MB'
'MB002', 'DET', 'TOR', '12:00', '08:00', 'Late', '24hr', 'nonstop', '0', '0', 'MB'
'PP001', 'DET', 'NYC', '21:30', '12:00', 'On-Time', '24hr', 'nonstop', '0', '0', 'PP'
'VM001', 'HOU', 'MAT', '15:45', '10:00', 'Late', '24hr', 'nonstop', '0', '0', 'VM'
'VM002', 'HOU', 'ATL', '23:00', '12:00', 'Late', '24hr', 'nonstop', '0', '0', 'VM'
