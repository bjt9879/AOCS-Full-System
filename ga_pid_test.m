%previous optimization
%x =1.0e+03 * [0.7302 0.6683 1.8434 1.7519 1.1294 1.4352 1.1252 0.9070 0.8988 1.0564 1.1748 1.0743];

override=2;

pr=x(1);
dr=x(2);
pp=x(3);
dp=x(4);
py=x(5);
dy=x(6);
  
attitude_0=[0,0,0];
attitude_rate_0=[0,6.7e-05,0.0041];
slew=[60 0 0];
%_______Transfer K to corrsponding database
assignin('base','pr',pr);
assignin('base','dr',dr);
assignin('base','pp',pp);
assignin('base','dp',dp);
assignin('base','py',py);
assignin('base','dy',dy);
assignin('base','attitude_rate_0',attitude_rate_0);
assignin('base','attitude_0',attitude_0);
assignin('base','slew',slew);