% Function：
%   Selective draw a list of arrays, aiming at easier comparation.
% Params：
%   config: a struct that contains `name`, `data`, `titles`, `enable`. `name` is the figure name; `data` contains a list of datas, whose first element is the legend, and the other elements are sub-figure arrays. `titles` contains all legends. `enable` determines which data element will be drawn.

function SelectiveDraw(config)
  %% check input
  % check if the length of options in data is consistent with each other.
  if length(config.data) < 2
    error('too few options in `config.data`, two elements at least is needed.')
  end
  for ii = 2:length(config.data)
    if length(config.data{ii}) ~= length(config.data{ii - 1})
      error('length of options in `config.data` os not consistent.')
    end 
  end
  % check if length of config.titles and length of elements in configj.data are consistent
  if length(config.titles) ~= length(config.data{1}) - 1
    error('The length of config.titles and length of elements in configj.data not consistent')
  end

  % Draw accroding to config.enable
  set(gcf, 'Name', config.name);
  legends = [];
  % Get legends
  for ii = 1:length(config.enable)
    index = config.enable(ii);
    legends = [legends; config.data{index}{1}];
  end
  % Draw via for loop
  subNum = length(config.titles);
  for ii = 1:subNum
    subplot(subNum, 1, ii);
    hold on;
    for jj = 1:length(config.enable)
      index = config.enable(jj);
      data = config.data{index}{ii+ + 1};
      % whether set x-axis or not
      if isfield(config, 'x')
        plot(config.x, data)
      else 
        plot(data);
      end
    end
    hold off;

    legend(legends);
    title(config.titles{ii});
  end
end