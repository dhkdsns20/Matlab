viewer = siteviewer(Buildings="chungbuk_map.osm");
tx1 = txsite(Latitude=36.625539, Longitude=127.455853, TransmitterFrequency=5.9e9); % 5.9 GHz
tx2 = txsite(Latitude=36.624182, Longitude=127.455777, TransmitterFrequency=5.9e9); % 5.9 GHz
show(tx1); show(tx2);

pm = propagationModel("rain",RainRate=50);
pl = pathloss(pm,rx,tx)