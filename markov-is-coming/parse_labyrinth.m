function [Labyrinth] = parse_labyrinth (file_path)
    in = fopen(file_path, 'r');
    if (in == -1)
        error("Nu s-a putut deschide fisierul pentru citire!");
    endif
    % se citesc dimensiunile matricii
    sizes = fscanf(in, '%d', 2);
    % se salveaza in row numarul de linii ale matricii
    lines = sizes(2);
    % se salveaza in col numarul de coloane ale matricii
    cols = sizes(1);
    % se citeste matricea Labyrinth
    Labyrinth = fscanf(in, '%d', [lines cols])';
    fclose(in);
endfunction
