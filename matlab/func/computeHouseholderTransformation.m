function H = computeHouseholderTransformation(n, d)

h = computeHouseholderTransformationMain(n);

H = [h, -2*d*n; 0, 0, 0, 1];
