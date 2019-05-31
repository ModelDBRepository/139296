%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A Spatially Extended Model for Macroscopic Spike-Wave Discharges %
% Peter N. Taylor & Gerold Baier                                   %
% peter.taylor@postgrad.manchester.ac.uk                           %
% J. Comp. Neurosci. 2011                                          %
% ---------------------------------------------------------------- %
% This code is an easy way to see what the hats look like for      %
% given parameter values.  Also shows the area under the hat.      %
% Usage: At the MATLAB command window type >> hatbuilder           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
boundary=25;
interval=0.5;
[ty,tmp]=mexhat(0, boundary, interval,0.5, 6);
disp(num2str(trapz(tmp)));
plot(ty,tmp);
hold on
[ty,tmp]=mexhat(0, boundary, interval,0.9, 1.25);
plot(ty,tmp,'r');
disp(num2str(trapz(tmp)));
[ty,tmp]=mexhat(0, boundary, interval,2,3);
plot(ty,tmp,'k');
disp(num2str(trapz(tmp)));
hold off