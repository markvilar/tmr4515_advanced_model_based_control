classdef KF
    % Kalman filter implementation for a stochastic LTI system:
    % x(k) = Adx(k-1) + Bdu(k) + v(k), v(k)~N(0,Qd)
    % z(k) = Cx(k) + w(k), w(k)~N(0,R)
    % The implementation assumes a constant sampling period.
    
    properties
        Ad % Discrete time transition matrix
        Bd % Discrete time input gain matrix
        Qd % Discrete time process noise covariance matrix
        C % Measurement matrix
        R % Measurement noise covariance matrix
    end
    
    methods
        function obj = KF(Ad, Bd, Qd, C, R)
            obj.Ad = Ad;
            obj.Bd = Bd;
            obj.Qd = Qd;
            obj.C = C;
            obj.R = R;
        end
        
        function [xpred, Ppred] = predict(obj, x, P, u)
            % Prediction step of the Kalman filter.
            xpred = obj.Ad*x + obj.Bd*u;
            Ppred = obj.Ad*P*obj.Ad' + obj.Qd;
        end
        
        function [vk, Sk] = innovation(obj, z, xpred, Ppred)
            % Calculates the innovations and innovation covariances.
            zpred = obj.C*xpred;
            vk = z - zpred;
            Sk = obj.C*Ppred*obj.C' + obj.R;
        end
        
        function [xupd, Pupd] = update(obj, z, xpred, Ppred)
            % Update step of the Kalman filter.
            [vk, Sk] = obj.innovation(z, xpred, Ppred);
            I = eye(size(Ppred));
            Wk = Ppred*obj.C\Sk;
            xupd = xpred + Wk*vk;
            Pupd = (I - Wk*obj.C)*Ppred*(I - Wk*obj.C)' + Wk*obj.R*Wk';
        end
        
        function NIS = NIS(obj, z, xpred, Ppred)
            % Calculates the normalized innovations squared.
            [vk, Sk] = obj.innovation(z, xpred, Ppred);
            NIS = vk'*Sk\vk;
        end
    end
end