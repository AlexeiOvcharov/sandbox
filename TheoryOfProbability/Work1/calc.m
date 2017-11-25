variant = 16;

%% Read data from file
file = fopen('var16.txt');
data = fscanf(file, '%f');
fclose(file);
X = sort(data);

%% Calculation Work 1

N = length(X);
R = X(N) - X(1);

n = round(log2(N) + 1);
h = R/n;

% Intervals
I_i = [(X(1):h:(X(N) - h))', (X(1) + h:h:X(N))'];
N_i = zeros(0, n);

el = 1;
for i = 1:n
    num = 0;
    for j = el:N
        if ((X(j) > I_i(i, 2)) && i < n)
            break;
        end
        num = num + 1;
    end
    N_i(i) = num;
    el = el + num;
end

avgX = (I_i(:, 1) + I_i(:, 2)) / 2;
p = N_i/N;
F = zeros(0, n);
for i = 1:n
    F(i) = sum(p(1:i));
end

mu = sum(avgX)/n;
s = 1/(n-1) * norm(avgX - mu)^2;
sigma = sqrt(s);

hist(X, n);
hold on;
y = 5:0.1:11;
nm = normpdf(y, mu, sigma)*100;
plot(y, nm);

%% Calculation work 2

r = 2;
m = n - r - 1;
alpha = 0.05;

p_norm = normcdf(I_i(:,2), mu, sigma) - normcdf(I_i(:,1), mu, sigma);
xi_ex = 0;
for i = 1:n
    xi_ex = xi_ex + (N_i(i) - N*p_norm(i))^(2) / (N*p_norm(i));
end

xi = 11.07;

tn = 2.365;     %% From table
mu_d = sigma*tn/sqrt(n);

xi_sigma = 16.01;
sigma_d = n*s^2/xi_sigma^2;

