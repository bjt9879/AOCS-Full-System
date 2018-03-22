function y = ga_pid_fit(d,~)

%y=[0 0 0 0 0 0];

y=[0 0 0];


%_______Set Kr, Ir, Dr
dr=d(1);
dp=d(2);
dy=d(3);
  

attitude_0=[0.0524,-0.0349,0.0175];
attitude_rate_0=[0.0873,-0.0873,-0.0873];
%_______Transfer K to corrsponding database

assignin('base','dr',dr);

assignin('base','dp',dp);

assignin('base','dy',dy);



assignin('base','attitude_0',attitude_0);
assignin('base','attitude_rate_0',attitude_rate_0);


%_______run the satellite model 
sim('XLS_detumbling.slx',[0,12000]);
close_system('XLS_detumbling.slx',0);
    
    %_______fitness function
    %     tr = 0.707106781*er(:)+0.707106781*d_er(:);
    %     dtr=-0.707106781*er(:)+0.707106781*d_er(:);
    %     tp = 0.707106781*ep(:)+0.707106781*d_ep(:);
    %     dtp=-0.707106781*ep(:)+0.707106781*d_ep(:);
    %     ty = 0.707106781*ey(:)+0.707106781*d_ey(:);
    %     dty=-0.707106781*ey(:)+0.707106781*d_ey(:);
    % for i=1:size(theta,1)-1%size(d1)-1
    %     yr=(tr(i+1)-tr(i))*(dtr(i)+0.5*(dtr(i+1)+dtr(i)));
    %     yp=(tp(i+1)-tp(i))*(dtp(i)+0.5*(dtp(i+1)+dtp(i)));
    %     yy=(ty(i+1)-ty(i))*(dty(i)+0.5*(dty(i+1)+dty(i)));
    %     y=abs(yr)+abs(yp)+abs(yy);
    % end
    %y_temp = trapz(t_time,abs(er))+trapz(t_time,abs(ep))+trapz(t_time,abs(ey));
    
    %Integrate the error & Phase
   
    %y = [trapz(t,abs(er)) , trapz(t,abs(ep)) , trapz(t,abs(ey)) , trapz(abs(d_er),abs(er)) , trapz(abs(d_ep),abs(ep)) , trapz(abs(d_ey),abs(ey))];
    
    %Integrate the Phase
   
    %y = [trapz(abs(er),abs(d_er)) , trapz(abs(ep),abs(d_ep)) , trapz(abs(ey),abs(d_ey))];
    
    
    %Integrate the error
    
    y = [trapz(t,abs(dtheta(:,1))) , trapz(t,abs(dtheta(:,2))) , trapz(t,abs(dtheta(:,3)))];
    
    
    %******** this one worked *****************
    
    %y = [trapz(t,er.^2) , trapz(t,ep.^2) , trapz(t,ey.^2)];
    
    %Integrate the Phase (numerical)
    
%     for k=1:size(t)-1
%         y_temp(1,1)=0.5*abs(abs(er(k+1))-abs(er(k)))*(abs(d_er(k))+abs(d_er(k+1)));
%         y_temp(1,2)=0.5*abs(abs(ep(k+1))-abs(ep(k)))*(abs(d_ep(k))+abs(d_ep(k+1)));
%         y_temp(1,3)=0.5*abs(abs(ey(k+1))-abs(ey(k)))*(abs(d_ey(k))+abs(d_ey(k+1)));
%         y(1,4) = y(1,1) + y_temp(1,1);
%         y(1,5) = y(1,2) + y_temp(1,2);
%         y(1,6) = y(1,3) + y_temp(1,3);
%     end
%     y(1,1)=trapz(t,abs(er));
%     y(1,2)=trapz(t,abs(ep));
%     y(1,3)=trapz(t,abs(ey));
    %Integrate the Phase
%     
%     y(1,1) = trapz(abs(d_er),abs(er));
%     y(1,2) = trapz(abs(d_ep),abs(ep));
%     y(1,3) = trapz(abs(d_ey),abs(ey));
    % Error Phase Length
%     dist_r=[er(:),d_er(:)];
%     y(1,1) = sum(pdist(dist_r));
%     dist_p=[ep(:),d_ep(:)];
%     y(1,2) = sum(pdist(dist_p));
%     dist_y=[ey(:),d_ey(:)];
%     y(1,3) = sum(pdist(dist_y));
%     parfor i=2:size(theta,1)
%       y_temp = sqrt((t1(i)-t1(i-1))^2+(d1(i)-d1(i-1))^2)+sqrt(((t2(i)-t2(i-1))^2)+((d2(i)-d2(i-1))^2))+sqrt(((t3(i)-t3(i-1))^2)+((d3(i)-d3(i-1))^2));
%       y=y + y_temp;
%     end
end 