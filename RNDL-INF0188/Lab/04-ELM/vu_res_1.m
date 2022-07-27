function vu_res_1 

tmp = load ('C:\Users\Sperry\Desktop\ELM\NuoveProve\Iris\Output_unif.txt'); 
nhid = tmp (:, 1); 
rmse_medio = tmp (:, 2); 
st_dev = tmp (:, 3); 
rmse_min = tmp (:, 4); 

tmp = load ('C:\Users\Sperry\Desktop\ELM\NuoveProve\Iris\Output_gauss.txt');
nhid2 = tmp (:, 1); 
rmse_medio2 = tmp (:, 2); 
st_dev2 = tmp (:, 3); 
rmse_min2 = tmp (:, 4); 

tmp = load ('C:\Users\Sperry\Desktop\ELM\NuoveProve\Iris\Output_spars.txt');
nhid3 = tmp (:, 1); 
rmse_medio3 = tmp (:, 2); 
st_dev3 = tmp (:, 3); 
rmse_min3 = tmp (:, 4); 

% figure(1) 
% plot (nhid, rmse_medio, 'b', nhid2, rmse_medio2, 'r', nhid3, rmse_medio3, 'g' ) 
% axis([0 290 0 0.8])
% ylabel ('RMSE-mean')
% % ylabel ('Mean Classification Rate')
% xlabel ('# hidden') 
% legend ('unif', 'gauss', 'sparse')

figure(2) 
plot (nhid, rmse_min, 'b', nhid2, rmse_min2,'r', nhid3, rmse_min3, 'g')  
axis([0 600 0 0.4])
grid on
% ylabel ('RMSE-min') 
ylabel ('Min Classification Rate')
xlabel ('# hidden') 
legend ('unif', 'gauss', 'sparse')

% figure(3) 
% plot (nhid, st_dev, 'b', nhid2, st_dev2,'r', nhid3, st_dev3, 'g')  
% axis([0 290 0 0.8])
% ylabel ('Standard Deviation') 
% xlabel ('# hidden') 
% legend ('unif', 'gauss', 'sparse')

return % END 



