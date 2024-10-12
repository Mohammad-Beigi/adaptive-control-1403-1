%% Example 2.1 Least-square estimation of static system

U = [0, 1, 2, 3, 4, 5, 6]';
Y = [1, 2, 2.2, 3.5, 4.6, 6.1, 7.8]';

num_data = length(U);
poly_order = [0 1 2 3];

for m = 1:4
    % Compute Phi
    Phi = ones(num_data, poly_order(m)+1);
    for i = 1:poly_order(m)
        Phi(:,i+1) = Phi(:,i) .* U;
    end

    % Estimate Parameter
    Theta = (Phi' * Phi) \ Phi' * Y;

    % loss function
    V = norm(Y - Phi * Theta, 2);

    subplot(2,2,m)
    plot(U, Y, 'bo', "LineWidth", 2), hold on
    plot(U, Phi * Theta, 'r', "LineWidth", 2), hold off
    grid on
    title("Order = " + poly_order(m) + ",  loss = " + V)
    xlabel("Input")
    ylabel("Output")

end
