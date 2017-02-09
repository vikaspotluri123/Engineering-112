data = load('peanut.txt');
iwant = data(:,2);

hist(iwant,10);
title('Frequency');
mystat(iwant);