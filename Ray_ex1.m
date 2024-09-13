% how reflected propagation paths in Chicago by using the SBR and image methods.
% Create a Site Viewer with buildings in Chicago. 
% For more information about the OpenStreetMap® file, see [1].

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




% Create a ray tracing propagation model, which MATLAB® represents using a RayTracing object. 
% Configure the model to use the image method and to calculate paths with up to one reflection. 
% Then, display the propagation paths.

pm = propagationModel("raytracing",Method="image", ...
    MaxNumReflections=1);
raytrace(tx,rx,pm)



% For this ray tracing model, there is one propagation path from the transmitter to the receiver.
% Update the ray tracing model to use the SBR method 
% and to calculate paths with up to two reflections 
% and up to one diffraction. Display the propagation paths.

pm.Method = "sbr";
pm.MaxNumReflections = 2;
pm.MaxNumDiffractions = 1;
raytrace(tx,rx,pm)