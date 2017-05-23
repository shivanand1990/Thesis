clear, clc, close all
%% constants
g=9.81; % gravitational acceleration [m/s^2]

%% vehicle
m = 1537; %mass [kg]
l = 2.76; %distance between axles [m]
a  =1.53; %distance between COG and front axle [m]
b = l-a;  %distance between COG and rear axle [m]

Fz1 = m*g*b/l;    %Fz front axle [kN]
Fz2 = m*g*a/l;    %Fz rear axle [kN]

alpha = 0:0.025:0.2  % slip angle [rad]

sim('MFtest_1');

C_alpha1 = 89600   % Cornering stiffness front axle [N/rad]
C_alpha2 = 104300  % Cornering stiffness rear axle [N/rad]

Fy1 = C_alpha1.*alpha  % front axle lateral force
Fy2 = C_alpha2.*alpha  % front axle lateral force

% plot(alpha,Fy_front,'r',alpha,Fy_rear,'g',alpha,Fy1,'k',alpha,Fy2,'b')
p1 = plot(alpha,Fy_front(1,:),'r')
hold on
p2 = plot(alpha,Fy_rear(1,:),'g')
hold on
p3 = plot(alpha,Fy1,'k')
hold on
p4 = plot(alpha,Fy2,'b')
hold off

xlabel( 'alpha(rad)'), ylabel( 'Fy(N)'), title('Fy vs Alpha'), grid on, hold on
% legend('MF-front','MF-rear','Lin-front','Lin-rear')
legend([p1 p2 p3 p4],'MF-front','MF-rear','Lin-front','Lin-rear')
