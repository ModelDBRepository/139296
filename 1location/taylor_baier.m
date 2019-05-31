%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A Spatially Extended Model for Macroscopic Spike-Wave Discharges %
% Peter N. Taylor & Gerold Baier                                   %
% peter.taylor@postgrad.manchester.ac.uk                           %
% J. Comp. Neurosci. 2011                                          %
% ---------------------------------------------------------------- %
% This code reproduces the SWD in figure 2c of the manuscript.     %
% Usage: At the MATLAB command window type >> taylor_baier         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function taylor_baier
    h1=2;
    h2=-1;
    h3=-2;
    init=[0.3282    2.9987    0.0517];
    options = odeset('AbsTol',0.000001,'RelTol',0.000001); %set options (error tolerance)
    [t,u] = ode45(@(t,u)ode(t,u,h1,h2,h3),[0:0.01:75],init*1,options);
    plot(t,mean(u'),'k');axis('tight');xlabel('Time');ylabel('Mean E,I_1,I_2');

function dudt=ode(t,u,h1,h2,h3)
    e1=u(1);
    if1=u(2);
    is1=u(3);

    w1=1.8;
    w2=1.5;
    w3=3.3;
    w4=4;
    w5=3;


    u=sigfunc(u);

    tau1=0.66;
    tau2=200;
    excitatory = u(1)*w1;
    inhibitory1 = u(2)*w2;
    inhibitory2 = u(3)*w3;
    
    % Eqn (1) from the manuscript
    de1dt  =  h1 -e1  + excitatory - inhibitory1 - inhibitory2;
    di1dt = (h2 -if1 + w4*u(1)) / tau1;
    di2dt = (h3 -is1 + w5*u(1)) / tau2;

    dudt=[de1dt;di1dt;di2dt];
function u=sigfunc(u)
    l=0.242;
    beg=-l;
    en=l;
    u=(u-beg).*(1/(en-beg));
    u(u>1)=1;
    u(u<0)=0;

    %  u=(1./(1+500.^-(u-0.5))); %uncomment this to use sigmoid (remember to also
    %  comment out the preceeding PWL code
end
end
end
