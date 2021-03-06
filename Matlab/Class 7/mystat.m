function [] = mystat(vector)
	fprintf('mean:  %.2f\n',mean(vector));
	fprintf('median:  %.2f\n',median(vector));
	fprintf('mode:  %.2f\n',mode(vector));
	fprintf('var:  %.2f\n',var(vector));
	fprintf('std:  %.2f\n',std(vector));
	fprintf('min:  %.2f\n',min(vector));
	fprintf('max:  %.2f\n',max(vector));
	fprintf('25th Percentile:  %.2f\n',prctile(vector,25));
	fprintf('75th Percentile:  %.2f\n',prctile(vector,75));
	fprintf('Count: %.0f\n',numel(vector));
end