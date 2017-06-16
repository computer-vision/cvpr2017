function plotResults(ns, ds, ps)

hold on;

daspect([1 1 1]);
grid on;

az = 0;
el = -60;
view(az, el);

for i_m = 1:size(ns,2)
  txt = sprintf('Mirror %d', i_m);
  plotPlane(ns{i_m}, ds{i_m}, txt);
end

offset_p = 0.5;
txt_p = sprintf('Referece points estimated by proposed method');
text(ps{1}(1,1)+offset_p, ps{1}(1,2)+offset_p, ps{1}(1,3)+offset_p, txt_p);

for i_p = 1:size(ps,2)
  plotPoints(ps{i_p});
end
  
hold off;

function plotPoints(p)

scale = 0.1;

for i_p = 1:size(p, 1)
  p_tmp = p(i_p,:);
  [x y z] = sphere;
  surf(scale*x + p_tmp(1), scale*y + p_tmp(2), scale*z + p_tmp(3));
end


function plotPlane(n, d, txt)

msize  = 10;
lwidth = 1;
scale = 1;
offset = 0.2;

foot = (scale * n * d)';
origin = [0 0 0];
p_locus = [origin; foot];

plot3(p_locus(:,1),p_locus(:,2),p_locus(:,3),'-o',...
    'MarkerSize',msize,...
    'LineWidth',lwidth);

text(foot(1)+offset, foot(2)+offset, foot(3)+offset, txt);

