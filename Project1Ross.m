l = 2;%Length of wire sides(cm)
step = .0001;%Step size(cm)
b = 0.5;%Speration of two rings
mu0 = 4*pi*10^(-9);%Vacuum permeability
C = 10^(-9);
x = b+l; %Initial loop 2 x value
y = 0; %Initial loop 2 y value
xp = 0; %Initial loop 1 x value
yp = 0; %Intial loop 1 y value
dM = 0;%Initialize infintesimal inductance
M = 0;%Initialize inductance

for t1 = 0:(pi/2):(3*pi/2) %Theta loop 1
    for l1 = 0:step:l %dl1
        xp = xp+(step*cos(t1)); %Loop 1 x position(cm)
        yp = yp+(step*sin(t1)); %Loop 1 y position (cm)
        for t2 = 0:(pi/2):(3*pi/2) %Theta loop 2
            for l2 = 0:step:l %dl2
                x = x+(step*cos(t2)); %Loop 2 x position(cm)
                y = y+(step*sin(t2)); %Loop 2 y positon(cm)
                theta = atan((y-yp)/(x-xp));
                dM = ((step^2)*cos(theta))/(((x-xp)^2+(y-yp)^2)^(1/2)); %Infintesimal inductance(cm)
                M = M+(C*dM); %Inductance(H)
            end
        end
    end
end
