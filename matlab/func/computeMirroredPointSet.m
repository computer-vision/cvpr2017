function [p_m q_m]= computeMirroredPointSet(p, n, d, A)

H = computeHouseholderTransformation(n, d);

p_h = transformToHomogeneousCoordinateSystem(p);
p_m_h = (H * p_h')';
p_m = p_m_h(:,1:3);

q_m = projectToImagePlane(p_m, A);
q_m_h = transformToHomogeneousCoordinateSystem(q_m);
