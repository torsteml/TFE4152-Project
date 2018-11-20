function plotFourPiksel
    array = importdata("Result750v24pixel.csv");
    t = array.data(:,1);
    tms = t.*1000;
    vexpose = array.data(:,4);
    verase = array.data(:,6);
    vout1 = array.data(:,9);
    vout2 = array.data(:,13);
    vnre_r1 = array.data(:,8);
    vnre_r2 = array.data(:,17);
    
    vn211 = array.data(:,5);
    
    
    hold on;
    xlim([0,11])
    ylim([-0.2 2.0])
    xlabel('Tid[ms]')
    ylabel('Spenning[V]')
    grid on;
    
    p1 = plot(tms,vexpose,'LineWidth',2);
    p2 = plot(tms,verase,'LineWidth',2);
    p3 = plot(tms,vout1,'LineWidth',2);
    p4 = plot(tms,vout2,'LineWidth',2);
    p5 = plot(tms,vnre_r1,'LineWidth',2);
    p6 = plot(tms,vnre_r2,'LineWidth',2);
    p7 = plot(tms,vn211,'LineWidth',2);
    
    
    lgd = legend([p1 p2 p3 p4 p5 p6 p7],{'Expose','Erase','Out1','Out2','NRER1','NRER2','N2'});
    lgd.FontSize = 15;
    hold off;
end