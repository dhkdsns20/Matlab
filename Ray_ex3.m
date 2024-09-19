% Discard Paths Based on Path Loss

% Ray tracing models enable you to discard propagation paths based on path loss thresholds.
% Specify a threshold relative to the strongest propagation path by using the MaxRelativePathLoss property.
% Specify an absolute threshold by using the MaxAbsolutePathLoss property.
% Create a Site Viewer with buildings in Chicago. For more information about the OpenStreetMap® file, see [1].

viewer = siteviewer(Buildings="chicago.osm");




% Create a transmitter site on a building and a receiver site near another building.
tx = txsite(Latitude=41.8800, ...
    Longitude=-87.6295, ...
    TransmitterFrequency=2.5e9);
show(tx)
rx = rxsite(Latitude=41.8813452, ...
    Longitude=-87.629771, ...
    AntennaHeight=30);
show(rx)





% Create a ray tracing propagation model, 
% which MATLAB represents using a RayTracing object. 
% Configure the model to find paths with up to 2 surface reflections and up to 1 edge diffraction. 
% By default, the model uses the SBR method.

pm = propagationModel("raytracing", ...
    MaxNumReflections=2, ...
    MaxNumDiffractions=1);





% Perform the ray tracing analysis. By default, the model discard paths 
% that are more than 40 dB weaker than the strongest path.

raytrace(tx,rx,pm,Type="pathloss")




% Discard Paths Based on Relative Path Loss

% Discard paths that are more than 50 dB weaker than the strongest path 
% by changing the MaxRelativePathLoss property of the RayTracing object. 
% Then, perform the ray tracing analysis again.


pm.MaxRelativePathLoss = 50;
raytrace(tx,rx,pm,Type="pathloss")






% To avoid discarding propagation paths, set the MaxRelativePathLoss property to Inf.

pm.MaxRelativePathLoss = Inf;
raytrace(tx,rx,pm,Type="pathloss")



% Discard Paths Based on Absolute Path Loss
%Discard paths with more than 115 dB of path loss 
% by setting the MaxAbsolutePathLoss property of the RayTracing object.

pm.MaxAbsolutePathLoss = 115;
raytrace(tx,rx,pm,Type="pathloss")





