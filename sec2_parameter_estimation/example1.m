%% Example 2.1 Least-square estimation of static system
clear, clc

U = [0, 1, 2, 3, 4, 5, 6]';
Y = [1, 2, 2.2, 3.5, 4.6, 6.1, 7.8]';

num_data = length(U);
poly_order = [0 1 2 3];
Theta = cell(4,1);
V = zeros(4,1);

%%
for i = 1:4
    % Compute Phi
    Phi = ones(num_data, poly_order(i)+1);
    for j = 1:poly_order(i)
        Phi(:,j+1) = Phi(:,j) .* U;
    end

    % Estimate Parameter
    theta = (Phi' * Phi) \ Phi' * Y;
    Theta{i} = theta;

    % loss function
    e = Y - Phi * theta;
    V(i) = e' * e;

    % Plot
    subplot(2,2,i)
    plot(U, Y, 'bo', "LineWidth", 2), hold on
    plot(U, Phi * theta, 'r', "LineWidth", 2), hold off
    grid on
    title("Order = " + poly_order(i) + ",  loss = " + V(i))
    xlabel("Input")
    ylabel("Output")
end

%% Loss
figure
bar(poly_order,V)
title("Loss Value for Different Model")
xlabel("polynomial order")
ylabel("squared sum of error")
