
% 13.8.3.1.1 ��������x���v�Z
[r1] = JEC_2110_2017_chap13_8_2_1_1(R1,theta1,method_12_3,thermalClass);


% 13.8.3.1.2 �����׎������ʂ𗘗p���ė㎥�C���_�N�^���X�E��R�����߂�
[X0,rM,Wm] = JEC_2110_2017_chap13_8_2_1_2(V,W,V1,I0,W0,R1);
%���Z
Z = sqrt(X0^2 + (rM+r1)  ^2);
I = V1/Z;
Pin = (rM+r1)*I^2 + Wm;
%Pin��W0�����������OK

% 13.8.3.1.3 �S���������ʂ𗘗p���ē񎟒�R�E�C���_�N�^���X�����߂�
[r2t,xt] = JEC_2110_2017_chap13_8_2_1_3(method,Vs,Is,Ws,Vs_,Is_,Ws_,fR,fL,r1,rM,X0,method_12_3,thermalClass);
%���Z
%L�`�ōl���Ă݂�
Z2 = sqrt(xt^2 + (r2t+r1)^2);
I2 = Vs/Z2;
Protor = (r2t+r1)*I2^2;
Zm = sqrt(X0^2 + rM^2);
Im = Vs/Zm;
Pmag = rM*Im^2;
Pshant = Protor + Pmag;
%Pshant��Ws�Ɠ��������OK

% 13.8.3.1.4 ���ׂ���w�肵�ėU���d���@�̓�����`��
s = [-10000:10000]/10000;
[I1,It,IgM,P1,P2,Wc1,Wc2,WG,Wh,Wt,eta,pf] = JEC_2110_2017_chap13_8_2_1_4(r1,X0,rM,r2t,xt,Wm,V1,s);
%JEC_2110_2017_chap13_8_2_1_5();


