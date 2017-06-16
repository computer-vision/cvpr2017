% DEMO Illustrates how to use the mirror calibration algorithm.

%
% Copyright (c) 2017, Kosuke Takahashi, Akihiro Miyata, Shohei Nobuhara and
% Takashi Matsuyama
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%    * Redistributions of source code must retain the above copyright notice,
%      this list of conditions and the following disclaimer.
%    * Redistributions in binary form must reproduce the above copyright
%      notice, this list of conditions and the following disclaimer in the
%      documentation and/or other materials provided with the distribution.
%    * Neither the name of the Graduate School of Informatics, Kyoto
%      University, Japan nor the names of its contributors may be used to
%      endorse or promote products derived from this software without specific
%      prior written permission.
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.
%


clear all;
close all;

addpath('./func');

model_row = 5;
model_col = 8;
model_size = 4.45;
num_of_mirror = 3;

A = load('../data/in_params.txt');
corners = load('../data/corners.txt');

for i = 1:10
  input{i} = corners(i,:);
end

%%%%%%%%%%%%%%% Calibration %%%%%%%%%%%%%%%%%
% Linear solution
[ns_t ds_t] = computeMirrorParameters(input, A, num_of_mirror);

% Non-linear solution
[ns_t_opt ds_t_opt] = optimizeMirrorParameters(input, A, ns_t, ds_t);


%%%%%%%%%%%%%%% Evaluation %%%%%%%%%%%%%%%%%

num_of_reflection = 2; % for evaluation of reprojection error
% Reprojection error for linear solution
p_base = computeTriangulationWithMirrorReflection(input, ns_t, ds_t, A, num_of_mirror);
[rep_ave rep_all] = computeReprojectionErrorWithMirrorReflections(...
    p_base, input, ns_t, ds_t, A, num_of_mirror, num_of_reflection);

% Reprojection error for non-linear solution
p_base_opt = computeTriangulationWithMirrorReflection(input, ns_t_opt, ds_t_opt, A, num_of_mirror);
[rep_ave_opt rep_all_opt] = computeReprojectionErrorWithMirrorReflections(...
    p_base_opt, input, ns_t_opt, ds_t_opt, A, num_of_mirror, num_of_reflection);


%%%%%%%%%%%%%%% Results %%%%%%%%%%%%%%%%%
fprintf('\n');
fprintf('Average reprojection error by proposed method : %f pixel.\n', rep_ave);
fprintf('Average reprojection error by proposed method (with non-linear refinement) : %f pixel.\n', rep_ave_opt);
fprintf('\n');

fprintf('=== Parameters by proposed method ===\n');
fprintf('---     n1,       n2,       n3 ---\n');
[ns_t{1}, ns_t{2}, ns_t{3}]
fprintf('---     d1,       d2,       d3 ---\n');
[ds_t{1}, ds_t{2}, ds_t{3}]

fprintf('=== Parameters by proposed method (with non-linear refinement) ===\n');
fprintf('---     n1,       n2,       n3 ---\n');
[ns_t_opt{1}, ns_t_opt{2}, ns_t_opt{3}]
fprintf('---     d1,       d2,       d3 ---\n');
[ds_t_opt{1}, ds_t_opt{2}, ds_t_opt{3}]

% plot results (non-linear solutions)
ps_opt = generateMirrorReflections(p_base_opt, ns_t_opt, ds_t_opt, A, num_of_mirror, num_of_reflection, 1);
plotResults(ns_t_opt, ds_t_opt, ps_opt);
