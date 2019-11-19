clear all
%Two square loops discretization method
l = 2; %Length of wire sides(cm)
step = .1; %Step size(cm)
b = 0.5; %Speration of two rings
mu0 = 4*pi*10^(-9); %Vacuum permeability(H/cm)
k = mu0/(4*pi); %Constant(H/cm)
x = b+l; %Initial loop 2 x value
y = 0; %Initial loop 2 y value
xp = 0; %Initial loop 1 x value
yp = 0; %Intial loop 1 y value
dM = 0; %Initialize infintesimal inductance
M = 0; %Initialize inductance
M_Exact = 0; %Initialize exact inducatance 

while step > .0001
    M = 0;
    for t1 = 0:(pi/2):(3*pi/2) %Theta loop 1
        for l1 = 0:step:l-step %dl1
            xp = xp+(step*cos(t1)); %Loop 1 x position(cm)
            yp = yp+(step*sin(t1)); %Loop 1 y position (cm)
            %plot(xp,yp,'.'); hold on
            for t2 = 0:(pi/2):(3*pi/2) %Theta loop 2
                for l2 = 0:step:l-step %dl2
                    x = x+(step*cos(t2)); %Loop 2 x position(cm)
                    y = y+(step*sin(t2)); %Loop 2 y positon(cm)
                    %if t1==0 && l1==0
                    %plot(x,y,'.'); hold on
                    %end
                    dM = ((step^2)*cos(t2-t1))/(((x-xp)^2+(y-yp)^2)^(1/2)); %Infintesimal length(cm)
                    M = M+(-k*dM); %Inductance(H)
                end
            end
        end
    end
    points = 2/step;
    plot(points,M*10^9,'.'); hold on
    step = step - .0001;
end

%Exact calculation from Equation 5 on pg.191
a = 4.5;
b = .5;
c = 2.5;
d = 2.5;
B = 0;
A = sqrt(a^2+B^2);
C = sqrt(c^2+B^2);
D = sqrt(d^2+B^2);
M_Exact = k*(c*log((a+A)/(c+C))+d*log((a+A)/(d+D))+b*log((b+B)/(a+A))+(C+D)-(A+B));

%axis([-.5 5 -.5 2.5])
%title('Square Loop Geometry','fontsize',20)
%xlabel('x(cm)','fontsize',20)
%ylabel('y(cm)','fontsize',20)

yline(M_Exact*10^9)
%axis([0 4000 0 2.5])
title('Mutual Inductance Convergence','fontsize',20)
xlabel('Points per side','fontsize',20)
ylabel('Mutual Inducatance(nH)','fontsize',20)

