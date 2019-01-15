function [I1,It,IgM,P1,P2,Wc1,Wc2,WG,Wh,Wt,eta,pf] = JEC_2110_2017_chap13_8_2_1_4(r1,X0,rM,r2t,xt,Wm,V1,s)
%	JEC-2110:2017の13.8.2.1.4での計算方法
%   ベクトルでの多点数計算に対応
%   s:すべり

g2 = (r2t./s) ./ ((r2t./s).^2 + xt.^2); 
b2 = xt ./ ((r2t./s).^2 + xt.^2);
gM = rM ./ (rM.^2 + X0.^2);
bM = X0 ./ (rM.^2 + X0.^2);
g3 = gM + g2;
b3 = bM + b2;
r3 = g3 ./ (g3.^2 + b3.^2);
x3 = b3 ./ (g3.^2 + b3.^2);
R  = r1 + r3;
X = x3;
Z = sqrt(R.^2 + X.^2);
V = V1./sqrt(3);


I1  = V./Z;
P1  = 3*I1.^2.*R;
Wc1 = 3*I1.^2*r1;
It  = I1 .* sqrt((g2.^2 + b2.^2) ./ (g3.^2 + b3.^2));
Wc2 = 3*It.^2*r2t;

PR = P1; %仮でこの式を置いた
WG  = 0.005 * PR; %漂遊負荷損の計算　PRってなに？
IgM = I1 .* gM ./ sqrt(g3.^2+b3.^2);
Wh  = 3 * IgM ./ IgM;

Wt  = Wc1 + Wc2 + WG + Wh + Wm;

P2  = P1 - Wt;
eta = P2./P1 *100;
pf  = R ./Z  *100;

%%%%%%%%グラフ作成
figure
%plot(shot_02250.time,shot_02250.RogoKoba,shot_10722.time, shot_10722.RogoKoba);
ax = subplot(1,1,1);
LineWidth = 1.0;
n = 10;
xlims = [-2 10];
FontSize = 14;
hold on 
%%%%%%%%%%%%%%%%%%%
%yyaxis left;
h = plot(s*100, P1/1000,'k','LineWidth',LineWidth);
h = plot(s*100, P2/1000,'r','LineWidth',LineWidth);
ax.XDir = 'reverse';
legend(["Electric Input";"Mechanical Output"])
% xlim(xlims);
% ylim([-400 400]);
ylabel('\it P_{\rm 1},P_{\rm 2} \rm (kW)','FontSize',FontSize,'FontName','Times');
set(gca,'FontSize',FontSize,'FontName','Times');
%h(1).Parent.XTickLabel = {};
ax = gca;
ax.YColor = 'black';
xlabel('{\rm Slip} \rm (%)','FontSize',FontSize,'FontName','Times');
hold off


end

