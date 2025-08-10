function LineChartF(app)

% Authors: Lissette Hernandez and Nicole Lopez
% Date: 4/13/2022
% EG 10118 Section 07

% Load data
data = load('data.mat');

% Size of data
[nRow, nCol] = size(data.data);

% List of unique years
yearList = unique(string(data.data(1:end,3)));
yearList = str2double(yearList);
nList = length(yearList);

% User year selected
yearSelected = app.YearButtonGroup.SelectedObject.Text;

% Convert to double
yearSelected = str2double(yearSelected);

% initialize a vector to store the sums of participants per year
sum = zeros(1,6);

% Find the total number of participants per year
for iYear = 1:nList
    count = 0;
    for iRow = 1:nRow
        if data.data{iRow,3} == yearList(iYear)
            count = count + 1;
        end
        sum(iYear) = count;
    end
end

% Find the last year to plot based on the year selected, where the year
% selected is the last year to plot
goal = find(yearList==yearSelected);


% Plot based on year given
for iL = 1:goal
    x= linspace(1896,yearList(iL),iL);
    plot(app.LineChartAxes,yearList(1:iL),sum(1:iL),'o-')
    axis(app.LineChartAxes,[1896, 1912, 0, max(sum)])
    drawnow
    
end


