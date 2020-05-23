% Function：
%   Test Selective draw.

%% data generation
x = 1:10;
%% Selective Dreaw config
config = {};
config.name = "Test Selective Draw";
config.data = {
  {"a=1", x, x .^ 2, x .^ 3},
  {"a=2", x * 2, x .^ 2 * 2, x .^ 3 * 2},
  {"a=3", x * 3, x .^ 2 * 3, x .^ 3 * 3},
};
config.titles = ["a*x"; "a*x^2"; "a*x^3"];
config.enable = [1, 2, 3];
config.x = x;

%% Selective Drawe
SelectiveDraw(config);