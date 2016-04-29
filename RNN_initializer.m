clear
clc
clf


limits = [0 11 0 11];
nNeurons = 350;
xCoords = limits(1)+(limits(2)-limits(1))*rand(nNeurons,1);
yCoords = limits(3)+(limits(4)-limits(3))*rand(nNeurons,1);
coords = [xCoords,yCoords];


nAffect = 6;
refDist = sqrt((limits(2)-limits(1)).^2+(limits(4)-limits(3)).^2);
w = zeros(nNeurons,nNeurons);
for ii = 1:nNeurons
  for jj = 1:nNeurons
    dist = sqrt((coords(jj,1)-coords(ii,1)).^2+(coords(jj,2)-coords(ii,2)).^2);
    relDist = (.04+dist)/refDist;
    if relDist < .07+rand^1*.01
      if sum(w(:,ii)) < rand*nAffect+1
        w(jj,ii) = 1;
      end
    end
  end
end
w = w+diag((~diag(w)-diag(w))); %invert diagonal

retain = [];
for ii = 1:nNeurons
  if sum(w(ii,:)) > 1 && sum(w(:,ii)) > 1
    retain = [retain ii];
  end
end
w = w(retain,retain);
nNeurons = size(w,1);
coords = coords(retain,:);

offset = 0.06;

xPlot = [];
yPlot = [];
wIndex = [];
for ii = 1:nNeurons
  for jj = 1:nNeurons
    if w(ii,jj) == 1  
      xPlot = [xPlot [coords(ii,1)+offset;coords(jj,1)-offset]];
      yPlot = [yPlot [coords(ii,2);coords(jj,2)]];
      wIndex = [wIndex [ii;jj]];
    end
  end
end

plot(coords(:,1),coords(:,2),'ok','linewidth',2)
axis(limits),axis square
hold on
plot(xPlot,yPlot)
axis equal
