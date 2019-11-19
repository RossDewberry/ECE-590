l = 2;%Length of wire sides(cm)
step = .001;%Step size(cm)
b = 0.5;%Speration of two rings
mu0 = 4*pi*10^(-9);%Vacuum permeability
C = 10^(-9);
x = b+l; %Initial loop 2 x value
y = 0; %Initial loop 2 y value
xp = 0; %Initial loop 1 x value
yp = 0; %Intial loop 1 y value
dM = 0;%Initialize infintesimal inductance
M11 = 0;
M13 = 0;
M22 = 0;
M24 = 0;
M31 = 0;
M33 = 0;
M42 = 0;
M44 = 0;
M = 0;%Initialize inductance

for t1 = 0:(pi/2):(3*pi/2) %Theta loop 1
    for l1 = 0:step:l-step %dl1
        xp = xp+(step*cos(t1)); %Loop 1 x position(cm)
        yp = yp+(step*sin(t1)); %Loop 1 y position (cm)
        for t2 = 0:(pi/2):(3*pi/2) %Theta loop 2
            for l2 = 0:step:l-step %dl2
                x = x+(step*cos(t2)); %Loop 2 x position(cm)
                y = y+(step*sin(t2)); %Loop 2 y positon(cm)
                R = sqrt((x-xp)^2+(y-yp)^2);
                theta = atan((y-yp)/(x-xp));
                if t1==0 && t2==0
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M11 = M11+(C*dM);
                elseif t1==0 && t2==pi
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M13 = M13+(C*dM);
                elseif t1==(pi/2) && t2==(pi/2)
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M22 = M22+(-C*dM);
                elseif t1==(pi/2) && t2==(3*pi/2)
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M24 = M24+(-C*dM);
                elseif t1==pi && t2==0
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M31 = M31+(C*dM);
                elseif t1==pi && t2==pi
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M33 = M33+(C*dM);
                elseif t1==(3*pi/2) && t2==(pi/2)
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M42 = M42+(C*dM);
                elseif t1==(3*pi/2) && t2==(3*pi/2)
                    dM = ((step^2)*cos(theta))/R; %Infintesimal inductance(cm)
                    M44 = M44+(C*dM);
                else
                    dM = 0; %Infintesimal inductance(cm) 
                end
                M = M11+M13+M22+M24+M31+M33+M42+M44; %Inductance(H)
            end
        end
    end
end
%M = 1.42661*10^-8 H .1
%M = 1.3352*10^-8 H .01
%M = 1.3224*10^-8 H .001
%M = 1.3212*10^-8 H .0001

%M = 1.3366*10^-8 H Exact Solution
