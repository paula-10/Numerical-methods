function [Adj] = get_adjacency_matrix(Labyrinth)
    % se determina dimensiunea matricei labirintului
    [lines, cols] = size(Labyrinth);
    nr_nodes = lines * cols + 2;
    
    % se creeaza matricea de adiacenta cu dimensiunile corespunzatoare
    Adj = zeros(nr_nodes, nr_nodes);
    
    % adaugam legaturile pentru starea WIN si starea LOSE
    win_idx = nr_nodes - 1;
    lose_idx = nr_nodes;

    % pentru fiecare celula din labirint, se construiesc legaturile
    for i = 1 : lines
        for j = 1 : cols
            % determin indexul curent in matricea de adiacenta
            idx = (i - 1) * cols + j;
        
            % se creeaza legaturile pentru iesirile de tip LOSE
            % exista o iesire LOSE pe partea stanga
            if (bitget(Labyrinth(i, 1), 1) == 0)
                Adj((i - 1) * cols + 1, lose_idx) = 1;
            endif
            % exista o iesire LOSE pe partea dreapta
            if (bitget(Labyrinth(i, cols), 2) == 0)
                Adj(i * cols, lose_idx) = 1;
            endif
            
            % se creeaza legaturile pentru iesirile de WIN
            % exista o iesire WIN in sus
            if (bitget(Labyrinth(1, j), 4) == 0)
                Adj(j, win_idx) = 1;
            endif
            % exista o iesire WIN in jos
            if (bitget(Labyrinth(lines, j), 3) == 0)
                Adj((lines - 1) * cols + j, win_idx) = 1;
            endif
        
            % se verifica daca exista o tranzitie spre nord
            if ((bitget(Labyrinth(i, j), 4) == 0) && (i > 1))
                north_idx = (i - 2) * cols + j;
                Adj(idx, north_idx) = 1;
            endif
        
            % se verifica daca exista o tranzitie spre sud
            if ((bitget(Labyrinth(i, j), 3) == 0) && (i < lines))
                south_idx = i * cols + j;
                Adj(idx, south_idx) = 1;
            endif
        
            % se verifica daca exista o tranzitie spre est
            if ((bitget(Labyrinth(i, j), 2) == 0) && (j < cols))
                east_idx = (i - 1) * cols + j + 1;
                Adj(idx, east_idx) = 1;
            endif
        
            % se verifica daca exista o tranzitie spre vest
            if ((bitget(Labyrinth(i, j), 1) == 0) && (j > 1))
                west_idx = (i - 1) * cols + j - 1;
                Adj(idx, west_idx) = 1;
            endif
        endfor
    endfor

    % se adauga legaturi pentru iesirile de tip WIN/LOSE
    Adj(win_idx, win_idx) = 1;
    Adj(lose_idx, lose_idx) = 1;
    Adj = sparse(Adj);
endfunction
