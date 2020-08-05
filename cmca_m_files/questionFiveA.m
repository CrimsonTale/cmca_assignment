clc;
clear;

prompt = 'Enter a value for N: ';
userInput = input(prompt);
sum = 0;

if userInput >= 1
    for i=1:userInput
    givenEquation = 1/i + 1/((i+2)*(i+3));
    sum = sum + givenEquation;
    end
    fprintf('sum is %d\n', sum)
else
    % since i=1 is given, N must be >= 1
    while userInput < 1
        disp('Please run again using value greater than or equals to 1')
        userInput = input(prompt);
        if userInput >= 1
            for i=1:userInput
                givenEquation = 1/i + 1/((i+2)*(i+3));
                sum = sum + givenEquation;
            end
            fprintf('sum is %d\n', sum)
        end
    end
end

