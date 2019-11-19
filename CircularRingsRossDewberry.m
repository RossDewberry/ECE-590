clear all
%Two circular loops discretization method
d = 2.5; %Seperation of center of loops(cm)
a = 2/sqrt(pi); %Radius of loops(cm)
step = pi/10000; %Step size(cm)
mu0 = 4*pi*10^(-9); %Vacuum permeability(H/cm)
k = mu0/(4*pi); %Constant(H/cm)
x = d; %Initial loop 2 x value
y = 0; %Initial loop 2 y value
xp = 0; %Initial loop 1 x value
yp = 0; %Intial loop 1 y value
dM = 0; %Initialize infintesimal inductance
M = 0; %Initialize inductance
%plot([x,xp],[y,yp],'.','MarkerSize',20); hold on

for t1 = 0:step:(2*pi) %Theta loop 1
    xp = (a*cos(t1)); %Loop 1 x position(cm)
    yp = (a*sin(t1)); %Loop 1 y position (cm)
    %plot(xp,yp,'.'); hold on
    for t2 = 0:step:(2*pi) %Theta loop 2
        x = d+(a*cos(t2)); %Loop 2 x position(cm)
        y = (a*sin(t2)); %Loop 2 y positon(cm)
        %if t1==0
            %plot(x,y,'.'); hold on
        %end
        dM = ((step^2)*cos(t2-t1))/(((x-xp)^2+(y-yp)^2)^(1/2)); %Infintesimal length(cm)
        M = M+(-k*dM); %Inductance(H)
    end
end

%axis([-1.5 4 -1.5 1.5])
%title('Circular Loop Geometry','fontsize',20)
%xlabel('x(cm)','fontsize',20)
%ylabel('y(cm)','fontsize',20)

%M = 1.7020*10^-9 H   1/10000