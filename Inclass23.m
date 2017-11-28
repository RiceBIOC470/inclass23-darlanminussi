%In this directory, you will find a derivaitve function representing a
%three gene circuit in which each gene product represses the transcription of another
%gene in a cycle. This simple three gene circuit displays oscillations and was one
%of the first synthetic circuits ever constructed (see Elowitz & Leibler
%Nature 2000). 

% 1. Start with initial conditions x(1) = 1, x(2) = x(3) = 0. 
% Run the model for 200 time units and plot the result. verify that it
% does indeed oscillate. 


sol1 = ode23(@repressilator, [0 200], [1; 0; 0]);
plot(sol1.x, sol1.y, '.-', 'LineWidth', 2, 'MarkerSize', 24);
xlabel('Time'); ylabel('x,y'); set(gca, 'FontSize', 24);

% 2. What happens if you start with initial conditions x(1) = x(2) = x(3) =
% 0.5? Why?

sol1 = ode23(@repressilator, [0 200], [0.5; 0.5; 0.5]);
plot(sol1.x, sol1.y, '.-', 'LineWidth', 2, 'MarkerSize', 24);
xlabel('Time'); ylabel('x,y'); set(gca, 'FontSize', 24);

% it becomes a flatline because all the coefficients for the function will
% have the same multiplicative value

% 3. The strength of the repression is governed by the constant k2 which is
% the same for all the genes. What happens when you make k2 larger or
% smaller? Find the approximate value of k2 for which the system no longer
% oscillates. 

colors = ['g.-', 'r.-', 'y.-','m.-','c.-','b.-','k.-'];

for ii = 1:5:20
    global k2
    k2 = 0.5;
    sol1 = ode23(@repressilatorq3, [0 200], [1; 0; 0]);
    plot(sol1.x, sol1.y, colors(ii), 'LineWidth', 2, 'MarkerSize', 24); hold on;
    legendInfo{ii} = ['k2: ' num2str(ii)];
end

% For values below 0.5 the function stops oscilating


% 4. What happens when you make k2 larger or smaller for only one of the
% genes? 

colors = ['g.-', 'r.-', 'y.-','m.-','c.-','b.-','k.-'];

for ii = 1:5:20
    global k2
    global k2_2
    k2 = 5;
    k2_2 = 0.5;
    sol1 = ode23(@repressilatorq4, [0 200], [1; 0; 0]);
    plot(sol1.x, sol1.y, colors(ii), 'LineWidth', 2, 'MarkerSize', 24); hold on;
    legendInfo{ii} = ['k2: ' num2str(ii)];
end

for ii = 1:5:20
    global k2
    global k2_2
    k2 = 5;
    k2_2 = 50;
    sol1 = ode23(@repressilatorq4, [0 200], [1; 0; 0]);
    plot(sol1.x, sol1.y, colors(ii), 'LineWidth', 2, 'MarkerSize', 24); hold on;
    legendInfo{ii} = ['k2: ' num2str(ii)];
end


for ii = 1:5:20
    global k2
    global k2_2
    k2 = 5;
    k2_2 = 1000;
    sol1 = ode23(@repressilatorq4, [0 200], [1; 0; 0]);
    plot(sol1.x, sol1.y, colors(ii), 'LineWidth', 2, 'MarkerSize', 24); hold on;
    legendInfo{ii} = ['k2: ' num2str(ii)];
end

% for values < 0.5 the function stops oscilating. for values > 5 we start
% to see a separation of the curves and as we increase even more the
% function oscilates with a smaller frequency
