function p_h = transformToHomogeneousCoordinateSystem(p)

p_h = p;
p_h(:, size(p,2) + 1) = 1;
