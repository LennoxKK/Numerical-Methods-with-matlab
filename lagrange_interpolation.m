% Lagrange interpolation
clc;

x_values = [21 23 25];
y_values = [.3706 .4068 .4433];

% Value of x for which interpolation is conducted
x_int = .3887;
f_x_int = 0;

%find f(x_int) 
for i=1:length(y_values)
    if x_values(i) == 0
        continue;
    else
        num = 1;
        den = 1;
        for j = 1:length(y_values)
            if j ~= i
                num = num*(x_int - y_values(j));
                den = den*(y_values(i)-y_values(j));
            end
        end
        f_x_int = f_x_int + (num/den)*x_values(i);
    end
end
f_x_int
