tx = txsite(Name="MathWorks Apple Hill", ...
    Latitude=42.3001,Longitude=-71.3504, ...
    TransmitterFrequency=2.5e9);

rx = rxsite(Name="Fenway Park", ...
    Latitude=42.3467,Longitude=-71.0972);
show(tx); show(rx)

pm = propagationModel("rain",RainRate=50);
pl = pathloss(pm,rx,tx)