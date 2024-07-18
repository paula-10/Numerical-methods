function [path] = heuristic_greedy (start_position, probabilities, Adj)
    % se determina lungimea lui probabilities pentru a sti cate elemente exista
    len = length(probabilities);
    [lines, cols] = size(Adj);
    % visited este un vector care marcheaza daca un element a fost vizitata sau nu
    visited = zeros(len, 1);
    path = [start_position];
    visited(start_position) = 1;
    
    % bucla se executa cat timp path va contine elemente
    while (length(path) > 0)
        position = path(end);
        % daca positia initiala este una castigatoare, programul se termina
        if (position == len - 1)
            break;
        endif
        
        % neighbors va contine nodurile vecine nevizitate
        % initial, neighbors este un vector gol
        neighbors = [];
        % pentru pozitia data se parcurge linia
        i = 1;
        while (i <= cols)
            % se aleg doar elementele adiacente si nevizitate
            if ((Adj(position, i) == 1) && visited(i) == 0)
                neighbors(end + 1) = i;
            endif
            i = i + 1;
        endwhile
        
        % daca pozitia curenta nu are vecini nevizitati, se elimina din cale
        if (length(neighbors) <= 0)
            path(end) = [];
        else
            % se cauta vecinul cu cea mai mare probabilitate de win
            best_neigh = 0;
            best_prob = -1;
            for i = 1 : length(neighbors)
                neigh = neighbors(i);
                if (probabilities(neigh) >= best_prob)
                    best_neigh = neigh;
                    best_prob = probabilities(best_neigh);
                endif
            endfor
            % se marcheaza vecinul gasit ca vizitat si se adauga in vector
            visited(best_neigh) = 1;
            path = [path; best_neigh];
        endif
    endwhile
endfunction
