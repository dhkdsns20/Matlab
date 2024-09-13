% Launch Site Viewer with buildings in Chicago. 
% For more information about the OpenStreetMap® file, see [1].

viewer = siteviewer(Buildings="chicago.osm");



% Create a transmitter site on a building and a receiver site near another building.

tx = txsite(Latitude=41.8800, ...
    Longitude=-87.6295, ...
    TransmitterFrequency=2.5e9);
show(tx)



% Create a ray tracing propagation model, which MATLAB® represents using a RayTracing object. 
% Configure the model to find paths with up to 2 surface reflections and up to 1 edge diffraction. 
% By default, the model uses the SBR method.

pm = propagationModel("raytracing", ...
    MaxNumReflections=2,MaxNumDiffractions=1);




% Display the coverage map.

coverage(tx,pm,SignalStrengths=-100:5)