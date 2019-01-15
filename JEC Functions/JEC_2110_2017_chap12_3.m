function [theta_ref] = JEC_2110_2017_chap12_3(method,thermalClass)
%   JEC-2110:2017の12.3での基準巻線温度の計算
%   詳細説明をここに記述
    switch method
        case 4
            switch thermalClass
                case 'A'    
                    theta_ref = 75;
                case 'E'    
                    theta_ref = 75;
                case 'B'    
                    theta_ref = 95;
                case 'F'    
                    theta_ref = 115;
                case 'H'    
                    theta_ref = 135;
                otherwise
            end
        otherwise
    end
            
end

