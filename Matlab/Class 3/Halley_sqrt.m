function root = Halley_sqrt(A,e)
    if(~A>=1)
        Error('The input must be >= 1!');
    end
    lastGuess = 1; %xn, initialize as x1
    ims = (1/A)*(lastGuess)^2;
    newGuess = (lastGuess/8) * (15 - ims*(10-3*ims));
    TOL = e;
    while(abs(newGuess - lastGuess) > TOL)
        lastGuess = newGuess;
        ims = (1/A)*(lastGuess)^2;
        newGuess = (lastGuess/8) * (15 - ims*(10-3*ims));
    end
    root = newGuess;
end