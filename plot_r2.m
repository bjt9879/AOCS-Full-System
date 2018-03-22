close all;

figure('Name','AOCS Simulation Results','NumberTitle','off');
%Roll

subplot(3,4,1)
plot(t,rad2deg(theta(:,1)),'r-');
title('Roll - attitude');
%h = legend('Roll','Location','NorthEast');
xlabel('time(s)');ylabel('deg');
%set(h,'interpreter','none');

subplot(3,4,2)
plot(t,rad2deg(er),'r-');
title('Roll - error');
%h = legend('Roll','Location','NorthEast');
xlabel('time(s)');ylabel('deg');

subplot(3,4,3)
plot(t,Tc(:,1),'r-');
title('Roll - Control Torque');
%ylim('auto');
%xlim('auto');
%h = legend('Roll','Location','NorthEast');
xlabel('time(s)');ylabel('Nm');

subplot(3,4,4)
plot(rad2deg(er),rad2deg(d_er),'r-')
title('Roll - Phase Plane');
%h = legend('Roll','Location','NorthEast');
xlabel('error');ylabel('error rate');


%Pitch

subplot(3,4,5)
plot(t,rad2deg(theta(:,2)),'b-');
title('Pitch - attitude');
%h = legend('Pich','Location','NorthEast');
xlabel('time(s)');ylabel('deg');
%set(h,'interpreter','none');

subplot(3,4,6)
plot(t,rad2deg(ep),'b-');
title('Pitch - error');
%h = legend('Pich','Location','NorthEast');
xlabel('time(s)');ylabel('deg');

subplot(3,4,7)
plot(t,Tc(:,2),'b-');
title('Pitch - Control Torque');
ylim('auto');
xlim('auto');
%h = legend('Pich','Location','NorthEast');
xlabel('time(s)');ylabel('Nm');

subplot(3,4,8)
plot(rad2deg(ep),rad2deg(d_ep),'b-');
title('Pitch - Phase Plane');
%h = legend('Pich','Location','NorthEast');
xlabel('error');ylabel('error rate');

%Yaw

subplot(3,4,9)
plot(t,rad2deg(theta(:,3)),'g-');
title('Yaw - attitude');
%h = legend('yaw','Location','NorthEast');
xlabel('time(s)');ylabel('deg');
%set(h,'interpreter','none');

subplot(3,4,10)
plot(t,rad2deg(ey),'g-');
title('Yaw error');
%h = legend('yaw','Location','NorthEast');
xlabel('time(s)');ylabel('deg');

subplot(3,4,11)
plot(t,Tc(:,3),'g-');
title('Yaw Control Torque');
%ylim('auto');
%xlim('auto');
%h = legend('yaw','Location','NorthEast');
xlabel('time(s)');ylabel('Nm');

subplot(3,4,12)
plot(rad2deg(ey),d_ey,'g-')
title('Yaw Phase Plane');
%h = legend('yaw','Location','NorthEast');
xlabel('error');ylabel('error rate');
