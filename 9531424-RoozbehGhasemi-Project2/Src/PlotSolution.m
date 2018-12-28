function PlotSolution(p,model)
    x=model.x;
    y=model.y;
    
    plot(x,y,'o','MarkerSize',20,'Color',[0.4 0.5 0.9]);
    
    hold on;
    
    plot(x(p),y(p),'sk','MarkerSize',16,'MarkerFaceColor','y');
    
    n=model.n;
    for i=1:n
        text(x(p(i)),y(p(i)),num2str(i),...
            'HorizontalAlignment','center',...
            'VerticalAlignment','middle');
    end
    
    title('Quadratic Assignment Problem');
    
    hold off;
    axis equal;
    grid on;
    
    alpha = 0.1;
    
    xmin = min(x);
    xmax = max(x);
    dx = xmax - xmin;
    xmin = floor((xmin - alpha*dx)/10)*10;
    xmax = ceil((xmax + alpha*dx)/10)*10;
    xlim([xmin xmax]);
    
    ymin = min(y);
    ymax = max(y);
    dy = ymax - ymin;
    ymin = floor((ymin - alpha*dy)/10)*10;
    ymax = ceil((ymax + alpha*dy)/10)*10;
    ylim([ymin ymax]);

end