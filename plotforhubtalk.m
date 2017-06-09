mu=2*Edges/N;
fntsz=15;
%caption=strcat('N=',num2str(N),', recovery-rate=',num2str(r),', rewir-rate=',num2str(w),', av. degr.=',num2str(mu),', threshold=', num2str(thr));
cap1=strcat('N=',num2str(N),', average degree=',num2str(mu));
cap2=strcat('recovery rate=',num2str(recovery),', infection rate=',num2str(infrate),', rewiring rate =', num2str(w));

figure('units','normalized','outerposition',[0.2 0 0.6 1]);
plot(times,rhow);
ax = gca;
ax.YLim = [0 1];
ax.XLim = [times(1) times(end)];
ax.FontSize=fntsz;

title({'Disease Prevalence',cap1,cap2})
ylabel('Prevanlence') % x-axis label
xlabel('Time') % y-axis label

print('samplepath10sec1rew','-dpng','-r300');