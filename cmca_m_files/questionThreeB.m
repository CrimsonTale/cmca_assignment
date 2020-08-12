% clc, clear;

gravity = 9.8;

%mass cancels out therefore it is not a variable

prompt = 'Radius in metres: ';
userInputRadius = input(prompt);


if userInputRadius > 0
    minimumSpeed = sqrt(gravity * userInputRadius);
    fprintf('Minimum speed: %d m/s\n', minimumSpeed);
else
    disp('Please run again using a positive value for radius');
end