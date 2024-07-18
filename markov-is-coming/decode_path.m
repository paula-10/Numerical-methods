function [decoded_path] = decode_path (path, lines, cols)
    % determin lungimea vectorului
    len = length(path);
    % deoarece path contine si nodul WIN, il sterg si modific variabila len
    path(len) = [];
    len = len - 1;
    % initializez decoded_path ca o matrice de len linii si 2 coloane
    decoded_path = zeros(len, 2);
    % pentru fiecare element din cale, determin numarul liniei si numarul
        % coloanei, avand in vedere ca am calculat indexul cu formula 
        % (i - 1) * n + j
    for k = 1 : len
        i = ceil(path(k) / cols);
        j = mod(path(k) - 1, cols) + 1;
        % adaug in matrice, pe pozitiile corespunzatoare, coordonatele
        decoded_path(k, 1) = i;
        decoded_path(k, 2) = j;
    endfor

endfunction