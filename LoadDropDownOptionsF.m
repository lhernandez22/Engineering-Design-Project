function LoadDropDownOptionsF(app)

%   Authors: Lissette Hernandez and Nicole Lopez
%   Date: 4/13/22
%   EG 10118 Section 07

% Load data
data = load('data.mat');

% Find the number of rows and columns
[nRow, nCol] = size(data.data);

% Populate dropdown options
yearList = unique(string(data.data(1:end,3)));
app.YearDropDown.Items = yearList;

% Bring in year from dropdown as the selected year
yearSelected = str2double(app.YearDropDown.Value);

% Make column headers
app.SportsTable.ColumnName{1} = 'Number of Sports';
app.SportsTable.ColumnName{2} = 'Sport';


% Find the sports for the given year
count = 1;
List = {};
for iRow = 1:nRow
    if data.data{iRow,3} == yearSelected
        List{count} = data.data{iRow,6};
        count = count + 1;
    end
end

% Make a list of unique sport names
uniqueList = unique(List);
x = linspace(1,length(uniqueList),length(uniqueList));

%app.SportsTable.Data(:,1) = x;

cellArray = {};
% Make list of sports into a table
for iR = 1:length(uniqueList)
    cellArray{iR,1} = iR;
    cellArray{iR,2} = uniqueList{iR};
end

% Conver the cell to a table
table = cell2table(cellArray);

% Load the sport names into the table
app.SportsTable.Data = table;
