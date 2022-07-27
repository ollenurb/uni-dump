function xmse = mse(x)
  xmse = (sum (x.^2)) / numel(x);
return
