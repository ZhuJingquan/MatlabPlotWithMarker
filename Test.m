x1 = 1:0.01:10;
line1 = sin(x1);
x2 = 1:0.05:10;
line2 = cos(x2) + 4;
x3 = 1:0.01:9;
line3 = sin(x3) + 2*cos(x3) + 8;

MPM_NewPlot;
MPM_SetMarkerCount(10);
MPM_SetFixedLength(600);
MPM_AddLine(line1, 'sin(x)');
MPM_AddLine(line2, 'cos(x) + 4');
MPM_AddLine(line3, 'sin(x) + 2cos(x) + 8');
MPM_Plot;

xlabel('x');
ylabel('f(x)');
grid;