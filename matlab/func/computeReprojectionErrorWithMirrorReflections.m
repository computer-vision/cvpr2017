function [rep_ave rep_all] = ...
    computeReprojectionErrorWithMirrorReflections(...
    p_base, qs, ns, ds, A, num_of_mirror, num_of_reflection)

num_of_chamber = computeNumberOfChamber(num_of_mirror, num_of_reflection);

ps = generateMirrorReflections(p_base, ns, ds, A, num_of_mirror, num_of_reflection, 0);

for i_chamber = 1:size(ps, 2)
  qs_rep{i_chamber} = projectToImagePlane(ps{i_chamber}, A);
end

rep_all = [];

for i_c = 1:num_of_chamber
  rep_all = [rep_all; norm(qs_rep{i_c} - qs{i_c})];
end

rep_ave = mean(rep_all);
