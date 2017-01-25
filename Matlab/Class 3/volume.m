h = input('How full? ');
H = input('Height of Tank? ');
r = input('Radius? ');
vol = 0;

while(h >= 0)
    if(h > H)
        disp('Not funny :(');
        h = input('How full? ');
        while(~(isreal(h)))
            h = input('Lets. Try. Again. How full? ');
        end
    end
    if(h < r)
        vol = 1/3 * pi * h^2 *(3*r - h);
    else
        if ( h > r && h < (H-r))
            vol = (2/3 * pi * r^3) + pi * r^2 * (h-r);
        else
            vol = (pi * (r^2) * (H - 2*r)) + ((4/3)*pi*r^3) - ((1/3)*pi*((H-h)^2)*(3*r-H+h));
        end
    end
    disp(vol);
    h = input('How full? ');
    while(~(isreal(h)))
        h = input('Lets. Try. Again. How full? ');
    end
end