clc;
clear;

prompt = 'Enter name: ';
userName = input(prompt, 's');

%{
   For userPurchase, we must reject all isstrings and i,j to reject(cos i and j
   are treated as doubles and accepted. We want to reject all letters.
%}
while isempty(userName) || ~isnan(str2double(userName)) 
    disp('Name cannot be blank or contain numbers...')
    prompt = 'Enter name: ';
    userName = input(prompt, 's');
end

prompt = 'Enter address: ';
userAddress = input(prompt, 's');

while isempty(userAddress)
    disp('Address cannot be blank...');
    prompt = 'Enter address: ';
    userAddress = input(prompt, 's');
end

prompt = 'Enter amount of purchase: ';
userPurchase = input(prompt);

while isempty(userPurchase) || userPurchase < 0 || isstring(userPurchase) || ~isreal(userPurchase)
    disp('Amount must be an interger and possess value of 0 or more dollars...');
    prompt = 'Enter amount of purchase(integer): ';
    userPurchase = input(prompt);
end

prompt = 'Enter type of purchase(L for Laptop or D for Desktop): ';
userChoice = upper(input(prompt, 's'));
discount = 0;
netAmount = 0;

%{
while isempty(userChoice) || strcmp(userChoice, 'L' && userChoice ~= 'D')
    disp('Invalid type of purchase')
    prompt = 'Do you wish to continue purchase? (Y/N)';
    toContinue = upper(input(prompt, 's'));
    while toContinue == 'Y'
        prompt = 'Enter type of purchase(L for Laptop or D for Desktop): ';
        userChoice = upper(input(prompt, 's'));
        if toContinue == 'N'
            break
        elseif userChoice == 'L' || userChoice == 'D'
            continue
        else
            prompt = 'Enter type of purchase(L for Laptop or D for Desktop): ';
            userChoice = upper(input(prompt, 's'));
        end
    end
end
%}
if userChoice == 'L'
    switch true
        case (0 <= userPurchase) && (userPurchase <= 250)
            discount = (0/100) * userPurchase;
            netAmount = userPurchase - discount;
        case (251 <= userPurchase) && (userPurchase <= 570)
            discount = (5/100) * userPurchase;
            netAmount = userPurchase - discount;
        case (571 <= userPurchase) && (userPurchase <= 1000)
            discount = (7.5/100) * userPurchase;
            netAmount = userPurchase - discount;
        case userPurchase > 1000
            discount = (10/100) * userPurchase;
            netAmount = userPurchase - discount;
    end
elseif userChoice == 'D'
    switch true
        case (0 <= userPurchase) && (userPurchase <= 250)
            discount = (5/100) * userPurchase;
            netAmount = userPurchase - discount;
        case (251 <= userPurchase) && (userPurchase <= 570)
            discount = (7.6/100) * userPurchase;
            netAmount = userPurchase - discount;
        case (571 <= userPurchase) && (userPurchase <= 1000)
            discount = (10.0/100) * userPurchase;
            netAmount = userPurchase - discount;
        case userPurchase > 1000
            discount = (15.0/100) * userPurchase;
            netAmount = userPurchase - discount;
    end
end



fprintf('Name: %s\n', userName);
fprintf('Address: %s\n', userAddress);
fprintf('Net amount: $%d\n', netAmount);

%{
    while ~isempty(toContinue)
    toContinue = input('Do you want to continue purchase?, Y/N [Y]:','s');
        if toContinue == 'N'
            break
        end
    end

%}


%{
    Sir, this is my reason for using ~isreal for userPurchase part.
    A bit hard to explain just now because no display lol. Because by
    right, we not supposed to make assumption that the user always know
    what to input correct?


   For userPurchase, we must reject all strings/letters including i and j 
   (however, i and j are treated as numbers and accepted)
    
    // For this part(without isreal)... it rejects a-z except i and j.

    prompt = 'Enter amount of purchase: ';
    userPurchase = input(prompt);

    while isempty(userPurchase) || userPurchase < 0 || isstring(userPurchase)
        disp('Amount must be an interger and possess value of 0 or more dollars...');
        prompt = 'Enter amount of purchase(integer): ';
        userPurchase = input(prompt);
    end

    
    so if user enters a-z, it will reject automatically but if he enters i
    or j then the output will be accepted below, which we do not want.

    >> userPurchase = 0.000000000000000 + 1.000000000000000i
%}

