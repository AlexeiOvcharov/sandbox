clear();

data = read("/home/senserlex/homeworks/Vedyakov/lab1/src/dataVibr.dat", -1, 4);
angularVel = data(:, 1:2:3)/60;
encoderTicks = data(:, 2:2:4);

tickPerRev = encoderTicks./angularVel;
dt = ones(encoderTicks)./encoderTicks;
vel = encoderTicks./tickPerRev;

//etalonU = [0;data(1:12, 12)];
//etalonN = [0;data(1:12, 11)];
//
//err = [];
//
//for i = [1:1:6]
//    j = 2*i - 1;
//    idealVals(:, i) = (interpln([etalonN, etalonU]', data(:, j)))';
//    err(:, i) = data(:, j + 1) - idealVals(:, i);
//end

//x = [0:10:3000];
//y = 0.004*x;
//plot(x, y);
//plot(etalonN, etalonU);
//xlabel("$n, об/мин$", "fontsize", 4);
//ylabel("$U_\text{вых}$", "fontsize", 4);
