%previous optimization
%x =1.0e+03 * [0.7302 0.6683 1.8434 1.7519 1.1294 1.4352 1.1252 0.9070 0.8988 1.0564 1.1748 1.0743];

dr=x(1);
dp=x(2);
dy=x(3);


attitude_0=[0.0524,-0.0349,0.0175];
attitude_rate_0=[0.0873,-0.0873,-0.0873];

%_______Transfer K to corrsponding database


assignin('base','dr',dr);

assignin('base','dp',dp);

assignin('base','dy',dy);
assignin('base','attitude_rate_0',attitude_rate_0);
assignin('base','attitude_0',attitude_0);
