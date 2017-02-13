%Class 3 Homework - MatLab Review (Exam 2 Version C - Sort)
%NOTE: Had to rename the function because Matlab took precedenceof the
%native sort function over my code for some reason
function [sorted] = mySort(A)
    n = numel(A);
    for i=1:n
        min = A(i);
        indx = i;
        for j=i:n
            if(A(j) < min)
                indx = j;
                min = A(j);
            end
        end
        for k=indx:-1:i+1
            A(k) = A(k-1);
        end
        A(i) = min;
    end
    sorted = A;
    disp(sorted);
end