function H = computeHouseholderTransformationMain(n)

H = eye(3) - 2 * n * n';
