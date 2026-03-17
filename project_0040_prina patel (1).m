% PROJECT- Calculating Rate Of Chemical Reaction Using Matrix Algebra
% Step 1: Defining the rate constant matrix
%let rate constant for A to B = k1
k1 = 0.5
%let rate constant for B to C = k2
k2 = 0.3

K = [
    -k1,  0,    0;   
     k1, -k2,   0;   
     0,   k2,   0    
]

% Step 2: Defining the initial concentrations 
% for substance A, B, C respectively
C0 = [1; 0; 0]

% Step 3: Defining the time range (0 to 20) with 100 steps
t = linspace(0, 20, 100);  

% Step 4: Solving for concentrations using matrix algebra
C = zeros(3, length(t)); 

%C stores concentrations of ([A], [B], [C])

%number of rows are 3. It corresponds to the three
% substances ([A], [B], and [C])

%the number of columns are (length(t)) 
%It corresponds to number of time points.

for i = 1:length(t)
    C(:, i) = expm(K * t(i)) * C0; % Matrix exponential solution
end

% Step 5: Plotting the concentrations over time
figure;
plot(t, C(1, :), 'r-', 'LineWidth', 1.5, 'DisplayName', '[A] (Reactant)'); hold on;  
plot(t, C(2, :), 'b-', 'LineWidth', 1.5, 'DisplayName', '[B] (Intermediate)');      
plot(t, C(3, :), 'g-', 'LineWidth', 1.5, 'DisplayName', '[C] (Product)');           
hold off;

% Step 6: Adding labels and legend
xlabel('Time');
ylabel('Concentration');
title('Concentration vs. Time for Coupled Reactions');
legend('show', 'Location', 'northeast');  %show legend with labels from 'DisplayName'
grid on;