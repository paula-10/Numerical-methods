function [Link] = get_link_matrix (Labyrinth)
    % se salveaza in vector dimensiunile lui Labyrinth pentru a determina
        % dimensiunile matricei Link
    [m, n] = size(Labyrinth);
    nr_nodes = m * n + 2;
    Link = zeros(nr_nodes, nr_nodes);
    Adj = get_adjacency_matrix(Labyrinth);
    % in acest vector se contorizeaza numarul de elemente nenule de pe fiecare
        % linie
    ad_nodes = zeros(nr_nodes, 1);
    
    for i = 1 : nr_nodes
        for j = 1 : nr_nodes
            % daca se gaseste un element nenul, se contorizeaza
            if (Adj(i, j) == 1)
                ad_nodes(i) = ad_nodes(i) + 1;
            endif
         endfor
    endfor
    
    for i = 1 : nr_nodes
        for j = 1 : nr_nodes
            % se creeaza matricea Link, pe baza matricii de adiacenta
            if (Adj(i, j) == 1)
                Link(i, j) = Adj(i, j) / ad_nodes(i);
            endif
        endfor
    endfor
    Link = sparse(Link);
endfunction
