function [ t_slew ] = t_slew(acc,t_acc,slew)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
t_c=(slew/acc-t_acc^2)/t_acc;
t_slew=2*t_acc+t_c;
end

