function vec = transformEulerToVector(hl, el)

% hl (XZ plane), el (XY plane)
vec(1,1) = cos(el) * cos(hl);
vec(2,1) = sin(el);
vec(3,1) = cos(el) * sin(hl);
