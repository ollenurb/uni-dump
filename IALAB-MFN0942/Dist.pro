

distance(pos(Lat1, Lon1), pos(Lat2, Lon2)) :- 
    acos(sin(Lat1)*sin(Lat2)+cos(Lat1)*cos(Lon2 - Lon1))*6371.

