function [hl el] = transformVectorToEuler(vec)

% hl (XZ plane), el (XY plane)
x = vec(1);
y = vec(2);
z = vec(3);

el = atan2(y, sqrt(x*x + z*z));
hl = atan2(z, x);
