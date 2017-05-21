Data = dlmread('data/SecondSimetr.dat');
E_A = Data(:, 2);
alpha = Data(:, 1)*pi/180;
E_Am = max(E_A);

E_A0 = (E_Am*sin(alpha));
dE_A = E_A0 - E_A;
dE_Ap = 100*dE_A/E_Am;