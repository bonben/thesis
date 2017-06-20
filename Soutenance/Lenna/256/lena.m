A = load('lena_uncoded');
A = reshape(A, 256, 256);
A = uint8(A);
imwrite(A, "lena_uncoded.bmp");