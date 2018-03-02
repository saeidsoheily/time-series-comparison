__author__ = 'Saeid SOHILY-KHAH'
%Compute Dynamic Time-Alignment Kernel (DTAK) between two time series X and Y with S-C Band 
%-------------------------------------------------------------------------------------------
function [size_warping_path, path, dtak_similarity] = function_dtak(X, Y, sakoe_chiba_band, sigma)

%Compute the size of each time serie
%-------------------------------------------------------------------------------------------
n = size(X,1);
m = size(Y,1);

%Local Cost Matrix (kernel similarities)
%------------------------------------------------------------------------
for i = 1 : n
	for j = 1 : m
		C(i,j) = exp( -((X(i) - Y(j))^2) / (2 * (sigma^2)) ); %dtak similarity
	end;
end;

%Cost Matrix with Sakoe-Chiba Band
%-------------------------------------------------------------------------------------------
dtw = zeros(n,m);
dtw(1,1) = C(1,1);

for i = 2 : n
	dtw(i,1) = dtw(i-1,1) + C(i,1);
end;
for j = 2 : m
	dtw(1,j) = dtw(1,j-1) + C(1,j);
end;
for i = 2 : n
	for j = 2 : m
		if abs(i-j) <= sakoe_chiba_band 
			dtw(i,j) = C(i,j) + max( (C(i,j) + dtw(i-1,j-1)) , max(dtw(i-1,j),dtw(i,j-1)) );
		else
			dtw(i,j) = -Inf;
		end;
		
	end;
end;

%Compute Warping Path
%-------------------------------------------------------------------------------------------
i = n;
j = m;
path = zeros(n,m);
path(n,m) = 1;
size_warping_path = 1;

while (i > 1) || (j > 1)
	if (i == 1)
		j = j-1;
	elseif (j == 1)
		i = i-1;
	else
		if (dtw(i-1,j-1) == max(dtw(i-1,j-1) , max(dtw(i-1,j),dtw(i,j-1))))
			i = i-1;
			j = j-1;
		elseif (dtw(i,j-1) == max(dtw(i-1,j-1) , max(dtw(i-1,j),dtw(i,j-1))))
			j = j-1;
		else
			i = i-1;
		end;
	end;
	path(i,j) = 1;
	size_warping_path = size_warping_path + 1;
end;

%Compute DTAK similarity
%-------------------------------------------------------------------------------------------
dtak_similarity = dtw(n,m); 
%dtak_similarity = dtw(n,m) / (n+m);  % normalized Dtak 
%dtak_similarity = dtw(n,m) / size_warping_path;  % normalized Dtak (divided by path length)
