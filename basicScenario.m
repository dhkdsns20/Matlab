function [params] = basicScenario(params)
% simulation scenario with Poisson point process distributed base stations and moving users
% This scenario file shows how to set up a scenario with three sector
% antennas that are distributed through a Poisson point process and moving
% users of the three different movement types. A building is set up in the
% simulation scenario.
% This scenario also shows how to set up chunks for parallelization of the
% simulation.
%
% input:
%   params: [1x1]handleObject parameters.Parameters
%
% output:
%   params: [1x1]handleObject parameters.Parameters
%
% initial author: Lukas Nagel
% extended by: Agnes Fastenbauer
%
% see also launcherFiles.launcherExample, parameters.Parameters

%% General Parameters
% time config
params.time.numberOfChunks              = 10;   % a sufficently large number of chunks to achieve paralleization gain
params.time.feedbackDelay               = 3;    % number of slots it takes for feedback to reach base station
params.time.slotsPerChunk               = 20;	% the first 3 slots in a chunk are discarded, since no feedback is available
params.time.timeBetweenChunksInSlots    = 100;	% the chunks should be independent

% set the carrier frequency and bandwidth
params.carrierDL.centerFrequencyGHz             = 2;    % in GHz
params.transmissionParameters.DL.bandwidthHz    = 5e6;  % in MHz

% set channel trace length
% This should be large enough to get independent channel realizations for
% all users.
params.smallScaleParameters.traceLengthSlots = 50000;

% define the region of interest
params.regionOfInterest.xSpan = 500; % the ROI will go from -250 m to 250 m
params.regionOfInterest.ySpan = 500;
params.regionOfInterest.zSpan = 100; % make sure ROI is high enough to include all base stations
params.regionOfInterest.interferenceRegionFactor = 1.5; % add interference region with additional radius of 0.5 of the ROI
params.regionOfInterest.interference = parameters.setting.Interference.regionIndependentUser; % no users will be placed in the interference region

%% building
% add a building to the scenario
building = parameters.blockages.PredefinedBuilding;
building.floorPlan  = 40*[1,0,0,1,1; 0,0,1,1,0]; % build a closed building: 1st corner = last corner
building.height     = 15;
building.loss       = 20; % links going through walls will be affected by this loss (in dB)
building.positions  = [-50;-50]; % move center of buidling
params.buildingParameters('predefBuildings') = building;

%% Base Stations
poissonBS = parameters.basestation.Poisson2D;
poissonBS.density     = 10e-6; % 10 base station per km^6
poissonBS.antenna     = parameters.basestation.antennas.ThreeSector;
poissonBS.antenna.nTX = 1;
poissonBS.nSectors    = 3; % generate all three sectors of the three sector base station
params.baseStationParameters('Poisson') = poissonBS; % save base station in parameter list

%% Users with movement
% random walk
randomWalk = parameters.user.Poisson2D;
randomWalk.density              = 20e-6; % 20 users per km^2 - small for fast simulation
randomWalk.nRX                  = 1;
randomWalk.speed                = 500/3.6; % select high speed to see more movement
randomWalk.indoorDecision       = parameters.indoorDecision.Geometry; % decide depending on building
randomWalk.losDecision          = parameters.losDecision.UrbanMacro5G; % match random LOS decision with path loss model
randomWalk.movement             = parameters.user.movement.RandomWalk;
randomWalk.movement.correlation = 1;
randomWalk.channelModel         = parameters.setting.ChannelModel.VehA;
params.userParameters('randomWalkUser') = randomWalk; % add user to parameter list

% moving into one direction at constant speed
randDirection = parameters.user.Poisson2D;
randDirection.density           = 20e-6; % 20 users per km^2 - small for fast simulation
randDirection.nRX               = 1;
randDirection.speed             = 500/3.6; % make user move fast to see movement
randDirection.indoorDecision    = parameters.indoorDecision.Geometry;
randDirection.losDecision       = parameters.losDecision.UrbanMacro5G; % match random LOS decision with path loss model
randDirection.movement          = parameters.user.movement.RandomDirection;	% choose movement type
randDirection.channelModel      = parameters.setting.ChannelModel.VehA;
params.userParameters('randDirectionUser') = randDirection; % add user to parameter list

% predefined position for each slot [3 x nSlotsTotal x nUser]double
positions = [(0:(params.time.nSlotsTotal-1))-100; ((0:params.time.nSlotsTotal-1))-100; 1.5*ones(1, params.time.nSlotsTotal)];
predefUser = parameters.user.PredefinedPositions;
predefUser.positions                = [0; 0; 0]; % this position will be overwritten by the movement positions
predefUser.nRX                      = 1;
predefUser.speed                    = 500/3.6; % this speed will only affect the Doppler shift in the channel model
predefUser.indoorDecision           = parameters.indoorDecision.Geometry;
predefUser.losDecision              = parameters.losDecision.UrbanMacro5G; % match random LOS decision with path loss model
predefUser.movement                 = parameters.user.movement.Predefined;
predefUser.movement.positionList    = positions;
predefUser.channelModel             = parameters.setting.ChannelModel.VehB;
params.userParameters('predefinedMovementUser') = predefUser; % add user to parameter list
end

