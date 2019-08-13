function PlotData(X,y)

pos = y == 1;

%visualizing data
plot (X(pos,2) , X(pos,3) , 'mx', 'linewidth' , 2 , 'markersize' , 7)
hold on
plot (X(~pos,2) , X(~pos,3) , 'ok',  'markersize' , 7 , ...
    'markerfacecolor' , 'b')

xlabel('feature 1');
ylabel('feature 2');


end

