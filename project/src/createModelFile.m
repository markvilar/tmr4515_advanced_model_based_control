function createModelFile()
    k1 = 0.15;
    k2 = 1.626;
    k3 = 0.1;
    k4 = 0.1;
    k5 = 1.7;

    b1 = 0.1;
    b2 = 0.1;
    b3 = 0.1;
    b4 = 0.1;
    b5 = 0.1;

    Jm1 = 1;
    Jm2 = 1;
    Jl1 = 1;
    Jl2 = 1;

    A = [
        zeros(4,4), eye(4), zeros(4,2);
        (1/Jl1)*[-(k1+k2+k3), k2, k3, 0, -(b1+b2+b3), b2, b3, 0, 1, 0];
        (1/Jm1)*[k2, -(k2+k4), 0, k4, b2, -(b2+b4), 0, b4, 0, 0];
        (1/Jm2)*[k3, 0, -(k3+k5), k5, b3, 0, -(b3+b5), b5, 0, 0];
        (1/Jl2)*[0, k4, k5, -(k4+k5), 0, b4, b5, -(b4+b5), 0, 1];
        [zeros(1,8), -0.2, 0];
        [zeros(1,7), 0, 0, -0.2];
        ];
    B = [
        zeros(5,2);
        (1/Jm1)*eye(2);
        zeros(3,2);
        ];
    C = [
        [1, zeros(1,9)];
        [zeros(1,3), 1, zeros(1,6)];
        ];
    G = [
        zeros(8,2);
        0.2*eye(2);
        ];
    sys = ss(A, B, C, []);
    save('ctrlPlantModel.mat', 'A', 'B', 'C', 'G', 'sys');
end