function sum = my_sum(x)
    sum = 0;
    for i=1:numel(x)
        sum = sum + x(i);
    end
end