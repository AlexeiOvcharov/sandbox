variant = 16;

%% Read data from file
file = fopen('var16.txt');
data = fscanf(file, '%f');
fclose(file);
X = sort(data);

%% Calculation

N = length(X);
R = X(N) - X(1);

n = round(log2(N) + 1);
h = R/n;

% Intervals
I_l = X(1):h:X(N);
N_l = zeros(0, n);
el = 1;
for i = 2:(n + 1)
    num = 0;
    for j = el:N
        if ((X(j) > I_l(i)) && i < n + 1)
            break;
        end
        num = num + 1;
    end
    N_l(i - 1) = num;
    el = el + num;
end

avgX = (I_l(1:n) + I_l(2:n+1)) / 2;
p = N_l/N;
F = zeros(0, n);
for i = 1:n
    F(i) = sum(p(1:i));
end
f = p/h;

mu = sum(avgX)/n;
s = 1/(n-1) * norm(avgX - mu)^2;
sx = sqrt(s);