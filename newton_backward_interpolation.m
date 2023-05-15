clc
close all
% Generate the x values and y values
x_values = 0:10:50;
y_values = [0.00000 0.17365 0.34202 0.50000 .64279 .76604];
y=y_values;

% find u and x0 given x
u=0;
x0=0;
index = 0;
x = 34.49995;
h=(x_values(2)-x_values(1));
for i=length(x_values):-1:1
    u = (x-x0)/h;
    if((x-x_values(i))<0)
        x0 = x_values(i);
        index = i;
    end
end



% Get sub-matrix of y_values starting from index
y_values = y_values(index:-1:1);

value = 0;
len = length(y_values);
for i = len:-1:1
    if(i==len)
        value = value+y_values(len); % f0 = y_values(len);
    else
        j=1;
        mult = 1;
        while ( j<=i-2 )
            mult=mult*(u-j);
            j=j-1;
        end
        value=value+(mult*u*y_values(len))/factorial(i-1);% f0 = y_values(len)
    end
    new_y = [];
    % Getting the differences of values
    for m=1:(length(y_values)-1)
        new_y = [new_y,(y_values(m+1)-y_values(m))];
    end
    y_values = new_y;
end
x_values
y
display(value);





