function [r2t,xt] = JEC_2110_2017_chap13_8_2_1_3(method,Vs,Is,Ws,Vs_,Is_,Ws_,fR,fL,r1,rM,X0,method_12_3,thermalClass)
%	JEC-2110:2017の13.8.2.1.3での計算方法
%   method: 1:拘束試験法A
%           2:拘束試験法B
%           3:拘束試験法C
switch method
    case 1 % 13.8.2.1.3.1 拘束試験方法Aによる方法
        Zs  = Vs  / (sqrt(3)*Is);   % 1倍周波数でのインピーダンス
        Rs  = Ws  / (3*Is^2);       % 1倍周波数でのレジスタンス
        Xs  = sqrt(Zs^2 - Rs^2);    % 1倍周波数でのリアクタンス
        
        Zs_ = Vs_ / (sqrt(3)*Is_);  % 1/2倍周波数でのインピーダンス
        Rs_ = Ws_ / (3*Is_^2);      % 1/2倍周波数でのレジスタンス
        Xs_ = sqrt(Zs_^2 - Rs_^2);  % 1/2倍周波数でのリアクタンス
        
        k = fL/fR;
        Xs___ = Xs_ / k;
        h = (Xs___ - Xs)/(Rs-Rs_);
        m = (k^2*(1+h^2) ) / (1-k^2);
        
        theta_ref = JEC_2110_2017_chap12_3(method_12_3,thermalClass);
        kR = (235+theta_ref)/(235+75);
        R_ = kR * (Rs_ - m*(Rs - Rs_));
        
        R2T = R_ - r1;
        XT = Xs___ + m*(Xs___ - Xs);
        g3_ = R2T / (R2T^2 + XT^2);
        b3_ =  XT / (R2T^2 + XT^2);
        gM  =  rM / (rM^2 + X0^2);
        bM  =  X0 / (rM^2 + X0^2);
        g2_ = g3_ - gM;
        b2_ = b3_ - bM;
        r2t = g2_ / (g2_^2 + b2_^2);
        xt  = b2_ / (g2_^2 + b2_^2);
    case 3 % 13.8.2.1.3.3 拘束試験方法Cによる方法
        Zs  = Vs  / (sqrt(3)*Is);   % 1倍周波数でのインピーダンス
        Rs  = Ws  / (3*Is^2);       % 1倍周波数でのレジスタンス
        Xs  = sqrt(Zs^2 - Rs^2);    % 1倍周波数でのリアクタンス
        
        R2S = Rs - r1;
        g3S = R2S / (R2S^2 + Xs^2);
        b3S = Xs  / (R2S^2 + Xs^2);
        gM  = rM  / (rM^2 + X0^2);
        bM  = X0  / (rM^2 + X0^2);
        g2S = g3S - gM;
        b2S = b3S - bM;
 
        theta_ref = JEC_2110_2017_chap12_3(method_12_3,thermalClass);
        kR = (235+theta_ref)/(235+75);
 
        r2t = kR * g2S / (g2S^2 + b2S^2);
        xt  =      b2S / (g2S^2 + b2S^2);
    otherwise
        error();
end

end

