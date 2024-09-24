classdef AntennaArray < parameters.basestation.antennas.Parameters
    % antenna array as specified in 3GPP TR 38.901
    %
    % initial author: Armand Nabavi
    %
    % see also parameters.basestation.antennas.Parameters,
    % networkElements.bs.Antenna,
    % networkElements.bs.antennas.AntennaArray

    properties
        % number of antenna elements per panel (vertical direction)
        % [1x1]integer
        nV = 2;

        % number of antenna elements per panel (horizontal direction)
        % [1x1]integer
        nH = 1;

        % number of panels (vertical direction)
        % [1x1]integer
        nPV = 2;

        % number of panels (horizontal direction)
        % [1x1]integer
        nPH = 1;

        % vertical element spacing
        % [1x1]double, divided by wavelength lambda
        dV = 0.5;

        % horizontal element spacing
        % [1x1]double, divided by wavelength lambda
        dH = 0.5;

        % vertical panel spacing
        % [1x1]double, divided by wavelength lambda
        dPV = 2;

        % horizontal panel spacing
        % [1x1]double, divided by wavelength lambda
        dPH = 2;

        % horizontal tx chains (nTX = N1 * N2)
        % [1x1]integer number of tx chains in horizontal direction
        N1 = 1;

        % vertical tx chains (nTX = N1 * N2)
        % [1x1]integer number of tx chains in vertical direction
        N2 = 1;

        % 3 dB beam width
        % [1x1]integer 3dB beam width as defined by standard
        theta3dB = 65;

        % maximum attenuation in dB
        % [1x1]double maximum attenuation
        maxAttenuation = 30;

        % maximum gain in dBi according to 3GPP 38.901 Table 7.3-1
        % [1x1]double maximum gain in dBi
        gaindBmax = 8;

        % 3 dB beam width in degrees
        % [1x1]integer 3dB beam width as defined by standard
        phi3dB = 65;
    end

    methods
        function obj = AntennaArray()
            % AntennaArray class constructor

            obj.precoderAnalogType = parameters.setting.PrecoderAnalogType.MIMO;
        end

        function checkParameters(obj, params)
            % check antenna parameters
            %
            % input:
            %   params:   [1x1]handleObject parameters.Parameters

            % check superclass parameters
            checkParameters@parameters.basestation.antennas.Parameters(obj, params);

            if obj.N1 * obj.N2 ~= obj.nTX
                warning("The product of N1 and N2 must equal nTX! N2 was changed to satisfy this condition.");
                obj.N2 = obj.nTX / obj.N1;
            end
        end
    end

    methods (Static)
        function createAntenna(antennaParameters, positionList, BS, params)
            % creates antenna arrays with antennaParameters
            %
            % input:
            %   antennaParameters:  [1 x 1]handleObject parameters.basestation.antennas.Parameters
            %   positionList:       [3 x nSlot]double position of antenna in each slot
            %   BS:                 [1x1]handleObject networkElements.BaseStation
            %   params:             [1x1]handleObject parameters.Parameters

            % create antenna objects
            antenna = networkElements.bs.antennas.AntennaArray;

            % set antenna parameters
            antenna.setGenericParameters(antennaParameters, positionList, params);

            % extend antennaList at the BS
            BS.antennaList(end+1) = antenna;
        end
    end
end

