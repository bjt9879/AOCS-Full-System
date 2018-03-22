%Main Program
%
%x=400*[100 10 100 01 100 10];
x=[2945.2	1789.6	3802	1382.9	3723.4	3941.7];
iterations=1;
sol=zeros(iterations,6);

for i=1:iterations
    InitialGroup=x;
    fitnessFunction=@ga_pid_fit;                                    %Fitness Function
    nvars=6;                                                        %number of variables
    ub=4000*[1 1 1 1 1 1];
    lb=[0 0 0 0 0 0];  %Lower Boundary
    options=gaoptimset;
    options=gaoptimset(options,'InitialPopulation',InitialGroup);   %Initial Population
    %options=gaoptimset(options,'PopulationSize',60);               %Initial size of Population,default 20
    %options=gaoptimset(options,'CrossoverFraction',0.8);           %CrossoverFraction
    %options=gaoptimset(options,'MigrationFraction',0.2);           %MigrationFraction
    %options=gaoptimset(options,'Generations',10);                  %100
    %options=gaoptimset(options,'StallTimeLimit',100);              %StallTimeLimit, 20
    options = gaoptimset('UseParallel', 'always', 'Vectorized', 'off');
    %options=gaoptimset(options,'TolFun',1e-10);                    %1e-6
    options=gaoptimset(options,'PlotFcns',{@gaplotscorediversity,@gaplotgenealogy,@gaplotstopping});
    %options=gaoptimset(options,'PlotFcns',{@gaplotbestf,@gaplotbestindiv,@gaplotscorediversity,@gaplotstopping});
    [x,fval,reason]=gamultiobj(fitnessFunction,nvars,[],[],[],[],lb,ub,[],options);  % Run the Optimizer
    for j=1:size(x,2)
        sol(i,j)=x(1,j);
    end
    csvwrite('solutions_1.sec_error_10%inertia.dat',sol)
end

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
sim('Simul_BASE_XLS.mdl',[0,140]);
close_system('Simul_BASE_XLS.mdl',0);
%plot_r
plot_r
%end