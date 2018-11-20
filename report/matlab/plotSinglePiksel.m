function plotSinglePiksel
    array = importdata("Result50v301pixel.csv");
    t = array.data(:,1);
    tms = t.*1000;
    vdd = array.data(:,2);
    vn1 = array.data(:,3);
    vexpose = array.data(:,4);
    vn2 = array.data(:,5);
    verase = array.data(:,6);
    vn3 = array.data(:,7);
    vnre = array.data(:,8);
    vout = array.data(:,9);
    
    hold on;
    xlim([0,50])
    ylim([-0.2 2.0])
    xlabel('Tid[ms]')
    ylabel('Spenning[V]')
    p1 = plot(tms,vexpose,'LineWidth',2);
    p2 = plot(tms,vn2,'LineWidth',2);
    p3 = plot(tms,verase,'LineWidth',2);
    p4 = plot(tms,vn3,'LineWidth',2);
    p5 = plot(tms,vnre,'LineWidth',2);
    p6 = plot(tms,vout,'LineWidth',2);
    lgd = legend([p1 p2 p3 p4 p5 p6],{'Expose', 'N2','Erase','N3','NRE','Out'});
    lgd.FontSize = 15;
    hold off;
    
end