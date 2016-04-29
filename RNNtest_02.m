
%clear

RNN_initializer
pause(2)
clf
clc
% w = [1 1 0 0 0 0 0 0 0;...
%   1 0 1 0 0 0 0 0 1;...
%   1 0 0 1 1 0 1 0 0;...
%   1 0 0 1 1 0 0 1 0;...
%   1 0 0 0 1 1 0 0 .1;...
%   1 0 0 0 1 0 0 1 .1;...
%   1 0 0 0 0 0 0 1 0;...
%   1 0 0 0 0 0 0 0 1];
w = [ones(size(w,1),1) w];
w = w.*randn(size(w,1),size(w,2));
s = rand(size(w,2),1);
s(1) = 1;

c = 2;
%plot(s)
%hold on
q = zeros(12,10);
for ii = 1:10
  a = 1;
  if ii > 20
    a = 0;
  end
  o = w*s;
  %o(6:15) = a;
  %o(5) = rand;
  o = 1./(1+exp(-c*o));
  s = [1;o];
  plot(s)
  clf
  colors = [s(wIndex(1,:)) s(wIndex(1,:)) s(wIndex(1,:))];
  set(groot,'defaultAxesColorOrder',colors)
  plot(xPlot,yPlot)
  axis equal
  pause(0.001)
  q(:,ii) = o(7:18);
end
colors = [    0    0.4470    0.7410
    0.8500    0.3250    0.0980
    0.9290    0.6940    0.1250
    0.4940    0.1840    0.5560
    0.4660    0.6740    0.1880
    0.3010    0.7450    0.9330
    0.6350    0.0780    0.1840];
set(groot,'defaultAxesColorOrder',colors)
figure(2)
plot(q')