function [x, err, steps] = perform_iterative (G, c, x0, tol, max_steps)
	% G -> iteration matrix
	% c -> iteration vector
	% x0 -> initial solution
	% tol -> accepted tolerance (norm of the difference between two solutions)
	% max_steps -> the maximum number of iterations
	
	% x -> final solution
	% err -> last calculated difference (as an euclidean norm)
	% steps -> actual number of steps performed

    % initializez valorile care urmeaza a fi prelucrate
    steps = 0;
    err = inf;
    x_old = x0;
    
    % cat timp nu s-a atins toleranta sau numarul de pasi impusi, se calculeaza
        % solutia si se actualizeaza eroarea si numarul de pasi
    while ((err > tol) && (steps < max_steps))
        x = G * x_old + c;
        err = norm(x - x_old);
        steps = steps + 1;
        x_old = x;
    endwhile
endfunction
