clc;
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
for i=1:length(x_values)
    u = (x-x0)/h;
    if((x-x_values(i))>0)
        x0 = x_values(i);
        index = i;
    end
end

% Get sub-matrix of y_values starting from index
y_values = y_values(index:end);

value = 0;
len = length(y_values);
for i = 1:len
    if(i==1)
        value = value+y_values(1); % f0 = y_values(1);
    else
        j=i-2;
        mult = 1;
        while ( j>0 )
            mult=mult*(u-j);
            j=j-1;
        end
        value=value+(mult*u*y_values(1))/factorial(i-1);
    end
     new_y = [];
     for m=1:(length(y_values)-1)
         new_y = [new_y,(y_values(m+1)-y_values(m))];
     end
     y_values = new_y;
end
x_values
y
x0
display(value);
            
        
    
        
        
        