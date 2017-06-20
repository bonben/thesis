A = load('lena_8_it.mat');
A = reshape(A, 128, 128);
A = uint8(A);
imwrite(A, "lena_8_it.bmp");