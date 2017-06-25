function [rep_ave rep_all] = ...
    computeReprojectionErrorWithMirrorReflections(...
    p_base, qs, ns, ds, A, num_of_mirror, num_of_reflection)

num_of_chamber = computeNumberOfChamber(num_of_mirror, num_of_reflection);

ps = generateMirrorReflections(p_base, ns, ds, A, num_of_mirror, num_of_reflection, 0);

for i_chamber = 1:size(ps, 2)
  qs_rep{i_chamber} = projectToImagePlane(ps{i_chamber}, A);
end

rep_all = [];

for i_chamber = 1:num_of_chamber
  for i_p = 1:size(qs_rep{1},1)
    rep = norm(qs_rep{i_chamber}(i_p,:) - qs{i_chamber}(i_p,:));
    rep_all = [rep_all; rep];
  end
end
  
rep_ave = mean(rep_all);
