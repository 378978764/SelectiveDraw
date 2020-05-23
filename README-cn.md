# Selective Draw
## 背景
在开发算法时，经常需要对比不同算法的结果，可能是两两比较，也可能是多个数据之间进行比较，更多的情况是需要随时调整比较哪些数据，而传统的做法是需要不停地注释、取消注释、更改`legend`等做法，于是封装了一个小函数，通过这样的配置即可快速进行不同数据的对比。

## 使用
代码已经发在了`github`上，地址：[SelectiveDraw](https://github.com/378978764/SelectiveDraw)，含有核心函数和测试用例。
```matlab
%% 测试数据
x = 1:10;
%% Selective Dreaw 配置
config = {};
% figure 的标题
config.name = "Test Selective Draw";
% 需要绘制的数据列表，第一个元素为该数据的名称，后面的数据为需要绘制的一维数组。
config.data = {
  {"a=1", x, x .^ 2, x .^ 3},
  {"a=2", x * 2, x .^ 2 * 2, x .^ 3 * 2},
  {"a=3", x * 3, x .^ 2 * 3, x .^ 3 * 3},
};
% 上方每个元素都有3组数据，这3组数据会形成3个sub figure，他们的sub title 如下：
config.titles = ["a*x"; "a*x^2"; "a*x^3"];
% 只进行1，2之间的对比，这个是核心
config.enable = [1, 2];
% （可选）指定绘图时的x轴数据
config.x = x;

%% Selective Draw，调用即可绘制
SelectiveDraw(config);
```
截图如下：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20200523163144836.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2hlemhvbmdsYTA4MTE=,size_16,color_FFFFFF,t_70)