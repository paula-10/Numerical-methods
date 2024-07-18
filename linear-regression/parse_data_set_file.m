function [Y, InitialMatrix] = parse_data_set_file (file_path)
    % se deschide fișierul pentru citire
    in = fopen(file_path, 'r');
    % se citesc dimensiunile matricei ca siruri separate
    sizes = fscanf(in, '%d', 2);
    lines = sizes(1);
    cols = sizes(2);
    % se inițializează matricea
    InitialMatrix = cell(lines, cols);
    
    for i = 1 : lines
        % se citeste elementul din vectorul Y
        Y(i) = fscanf(in, '%f', 1);
        % se citesc restul elementelor de pe linie in
        line_data = cell(cols, 1);
        for j = 1 : cols
            line_data{j} = fscanf(in, '%s', 1); 
        endfor
        % se stochează linia curenta in matrice pe linia corespuzatoare
        InitialMatrix(i, :) = line_data;
    endfor
    fclose(in);
endfunction