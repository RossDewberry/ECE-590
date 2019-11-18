%Bottom side of loop 1 on top side of loop 2

l = 2;%Length of wire sides(cm)
step = .0001;%Step size(cm)
b = 0.5;%Speration of two rings
mu0 = 4*pi*10^(-9);%Vacuum permeability
x = b+l;
y = 0;
xp = 0;
yp = 0;
dM = 0;%Initialize infintesimal inductance
M = 0;%Initialize inductance
checkx = 0;

for t1 = 0:(pi/2):(3*pi/2)
    for l1 = 0:step:l %dl1
        for t2 = 0:(pi/2):(3*pi/2)
            for l2 = 0:step:l %dl2
                x = x+(step*cos(t2)); %Loop 2 x position(cm)
                y = y+(step*sin(t2)); %Loop 2 y positon(cm)
                xp = xp+(step*cos(t1)); %Loop 1 x position(cm)
                yp = yp+(step*sin(t1)); %Loop 1 y position (cm)
                dM = ((step^2)*cos(t1-t2))/((x-xp)^2+(y-yp)^2)^(1/2); %Infintesimal inductance(1/cm)
                M = M+(mu0/(4*pi))*dM; %Inductance(H)
                checkx = checkx+xp;
            end
        end
    end
end
%M = 9.6166*10^-11  .1
%M = 8.8145*10^-12  .01
%M = 8.7347*10^-13  .001
%M = 8.7267*10^-14  .0001