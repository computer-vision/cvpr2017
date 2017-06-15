function n = computeNormalOfMirror(p0, p1, A)

num_of_point = size(p0,1);

U = [];

for i_p = 1:num_of_point
  x0 = p0(i_p, 1);
  y0 = p0(i_p, 2);
  x1 = p1(i_p, 1);
  y1 = p1(i_p, 2);
  
  u_tmp = [y0 - y1, x1 - x0, x0*y1 - x1*y0];
  U = [U; u_tmp];
end

% compute T matrix
T = U'*U;

% compute the eigen vectors of T
[V_T D_T] = eig(T);

% compute f vector as an eigen vector for smallest eigen value
f = V_T(:,1);

F = transformVectorToSkewSymmetricMatrix(f);

% modify F matrix
[U_F S_F V_F] = svd(F);
S_F(3,3) = 0;

F_modify = U_F * S_F * V_F';

E = A' * F_modify * A;

n = [E(3,2); E(1,3); E(2,1)];
n = n / norm(n);
