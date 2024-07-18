function [G, c] = get_Jacobi_parameters (Link)
    % se salveaza dimensiunile matricei Link, pentru a determina
        % dimensiunile maricei si vectorului de iteratie
    [line, col] = size(Link);
    % size_c determina numarul de linii sau coloane fara cele de WIN/LOSE
    size_c = line - 2;
    
    % G devine o submatrice care nu contine liniile si coloanele de WIN/LOSE
    G = Link(1 : size_c, 1 : size_c);
    G = sparse(G);
    c = zeros(size_c, 1);
    
    % se parcurg liniile si fiecare element nenul de pe coloana de WIN
        % se adauga pe linia corespunzatoare in vectorul c
    for i = 1 : size_c
        if (Link(i, col - 1) != 0)
            c(i) = Link(i, col - 1);
        endif
    endfor

endfunction
