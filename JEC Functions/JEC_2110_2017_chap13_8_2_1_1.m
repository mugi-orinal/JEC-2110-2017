function [r1] = JEC_2110_2017_chap13_8_2_1_1(R1,theta1,method_12_3,thermalClass)
% JEC-2110:2017の13.8.2.1.1での計算方法
% R1:測定値
% theta_ref,theta1:基準巻線温度、測定時の温度
%   詳細説明をここに記述
    theta_ref = JEC_2110_2017_chap12_3(method_12_3,thermalClass);
    r1 = (R1/2)*(235+theta_ref)/(235+theta1);
end

