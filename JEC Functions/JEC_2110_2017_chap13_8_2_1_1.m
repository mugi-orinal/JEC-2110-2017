function [r1] = JEC_2110_2017_chap13_8_2_1_1(R1,theta1,method_12_3,thermalClass)
% JEC-2110:2017��13.8.2.1.1�ł̌v�Z���@
% R1:����l
% theta_ref,theta1:��������x�A���莞�̉��x
%   �ڍא����������ɋL�q
    theta_ref = JEC_2110_2017_chap12_3(method_12_3,thermalClass);
    r1 = (R1/2)*(235+theta_ref)/(235+theta1);
end

