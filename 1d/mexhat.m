%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A Spatially Extended Model for Macroscopic Spike-Wave Discharges       %
% Peter N. Taylor & Gerold Baier                                         %
% peter.taylor@postgrad.manchester.ac.uk                                 %
% J. Comp. Neurosci. 2011                                                %
% ---------------------------------------------------------------------- %
% Returns a set of weights according to a mexican hat function           %
% distribution.  Requires input parameters (x) which is the location of  %
% the top of the 'hat', boundary which specifies the range assuming x=0  %
% (assumed to be symmetrical, and interval to set the resolution.        %
% Returns 2 vectors, xreturn which is a set of locations and w which     %
% are the corresponding weights.                                         %
% This code also takes into account periodic boundaries.                 %
%                                                                        %
% Example use:                                                           %
% >> [ty,tmp]=mexhat(0, 25, 0.5,2, 3); plot(ty,tmp); % Central           %
% >> [ty,tmp]=mexhat(22, 25, 0.5,2, 3); plot(ty,tmp); % At boundary      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xreturn,w]=mexhat(x, boundary, interval, A, sigma)
    interval=abs(interval);
    w=[];
    xreturn=[-boundary:interval:boundary];

    for i=2*-boundary:interval:2*boundary
        w=vertcat(w,weight(i,A,sigma));
    end
    wmidpoint=1+abs((2*-boundary)/interval);

    xpos=abs((-boundary-x)/interval)+1;
    xpos=round(xpos);
    tmp=zeros(length(xreturn),1);
    counter=0;
    for i=xpos:length(tmp)
        tmp(i)=tmp(i) + w(wmidpoint+counter);
        counter=counter+1;
    end
    for i=1:xpos-1
        tmp(i)=tmp(i) + w(wmidpoint+counter);
        counter=counter+1;
    end
    counter=0;
    for i=1:xpos-1
        tmp(xpos-i)=tmp(xpos-i) + w(wmidpoint-i);
        counter=counter+1;
    end
    counter2=0;
    for i=xpos:length(tmp)-1
        tmp(length(tmp)-counter2)=tmp(length(tmp)-counter2) + w((wmidpoint-counter));
        counter2=counter2+1;
        counter=counter+1;
    end
    tmp(xpos)=w(wmidpoint);
    if x==-boundary
        w=tmp(end:-1:1);
    end
    w=tmp;
    function wgt=weight(x, A, sigma)
    % This is identical to the equation used by Amari (1977), pg10, top left
       wgt=(A/(sqrt(2*pi*sigma)))*(exp(-((x^2)/(2*(sigma^2)))));
    end
end