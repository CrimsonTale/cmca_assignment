clc;
clear;
prompt = 'Would you like to carry on with purchase?[Y/N]: ';
additionalPurchase = upper(input(prompt, 's'));
while ~isempty(additionalPurchase) || not(strcmp(additionalPurchase, 'Y')) && not(strcmp(additionalPurchase, 'N'))
    if strcmp(additionalPurchase, 'Y')
  
            prompt = 'Enter name: ';
            userName = input(prompt, 's');

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

            %{
            userPurchase = input(prompt); <--- no 's' flag, so all inputs are doubles
            isnumeric('userPurchase') for inputs 'i' and 'j' are logical = 1(true)
            therefore isreal has to be used in this scenario, where i and j are not
            chars, but imaginary numbers when input(prompt) is used.
            %}

            while isempty(userPurchase) || userPurchase < 0 || isstring(userPurchase) || ~isreal(userPurchase)
                disp('Amount must be an interger and possess value of 0 or more dollars...');
                prompt = 'Enter amount of purchase(integer): ';
                userPurchase = input(prompt);
            end

            prompt = 'Enter type of purchase(L for Laptop or D for Desktop): ';
            userChoice = upper(input(prompt, 's'));
            discount = 0;
            netAmount = 0;



            while isempty(userChoice) || not(strcmp(userChoice, 'L')) && not(strcmp(userChoice, 'D'))
                disp('Invalid type of purchase')
                prompt = 'Do you wish to continue purchase? [Y/N]: ';
                toContinue = upper(input(prompt, 's'));
                if strcmp(toContinue, 'Y') 
                    prompt = 'Enter type of purchase(L for Laptop or D for Desktop): ';
                    userChoice = upper(input(prompt, 's'));
                    discount = 0;
                    netAmount = 0;
                elseif strcmp(toContinue, 'N')
                    disp('You have exit purchase screen, Goodbye')
                    break
                else
                    disp('Please enter [Y/N] only...');
                    continue
                end
            end

            %{
                following tweaks made:
            
                case has to be <251, <571 and not <=250,<=570 or else no
                discount will be applied for values between 250 and 251;
                570 and 571
                eg. $250.50 or $570.20 will result in net amount $0.
            %}
            if userChoice == 'L'
                switch true
                    case (0 <= userPurchase) && (userPurchase < 251)
                        discount = (0/100) * userPurchase;
                        netAmount = userPurchase - discount;
                    case (251 <= userPurchase) && (userPurchase < 571)
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
                    case (0 <= userPurchase) && (userPurchase < 251)
                        discount = (5/100) * userPurchase;
                        netAmount = userPurchase - discount;
                    case (251 <= userPurchase) && (userPurchase < 571)
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
            
            prompt = 'Continue? [Y/N]: ';
            toContinue = upper(input(prompt, 's'));
            if strcmp(toContinue, 'N')
                disp('Thanks and see you again')
                break
            elseif strcmp(toContinue, 'Y')
                continue
            else
                disp('Please enter [Y/N] only...');
                prompt = 'Continue? [Y/N]: ';
                toContinue = upper(input(prompt, 's'));
            end


    elseif strcmp(additionalPurchase, 'N')
             disp('Thanks and see you again')
             break
    else
            disp('Please enter [Y/N] only...');
            prompt = 'Would you like to carry on with purchase?[Y/N]: ';
            additionalPurchase = upper(input(prompt, 's'));   
    end

end
