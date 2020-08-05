% clc, clear;

gravity = 9.8;

%{
    // mass cancels out therefore it is not a variable
    mgh = 0.5mv^2 + mg(2R)
    gh = 0.5v^2 + 2gR
%}

prompt = 'Radius in metres: ';
userInputRadius = input(prompt);


if userInputRadius > 0
    minimumSpeed = sqrt(gravity * userInputRadius);
    fprintf('Minimum speed: %d m/s\n', minimumSpeed);
else
    disp('Please run again using a postive value for radius');
end