% clc;
% clear;

prompt = ('Conversions for the following: \nDegrees to Radians(DR)\nRadians to Degrees(RD)\nPlease type DR or RD: ');
userInput = input(prompt, 's');

while not(isempty(userInput))
    if upper(userInput) == 'DR'
        prompt = ('Enter angle in degrees: ');
        drUserInput = input(prompt);
        if not(isempty(drUserInput))
            drEquation = drUserInput * (pi/180);
            fprintf('Radians: %d\n', drEquation);
        else
            disp('No valid input detected. Terminating...')
            break
        end
    elseif upper(userInput) == 'RD'
        prompt = ('Enter angle in radians: ');
        rdUserInput = input(prompt);
        if not(isempty(rdUserInput))
            rdEquation = rdUserInput * (180/pi);
            fprintf('Degrees: %d\n', rdEquation);
        else
            disp('No valid input detected. Terminating...')
            break
        end
    else
        disp('No valid input detected. Terminating...')
        break
    end
end
