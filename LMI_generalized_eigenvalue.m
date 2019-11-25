% LMI for Generalized Eigenvalue Problem
clc; clear; close all;

lambda = sdpvar(1);

x1 = sdpvar(1);
x2 = sdpvar(1);

A0 = [3  1; 2 1];
A1 = [2 -1; 1 2];
A2 = [1  2; 1 3];

B0 = [6 -4; 1 1];
B1 = [8 -2; -2 2];
B2 = [5 -1; 3 3];

C0 = [6 4; 1 1];
C1 = [8 2; 2 2];
C2 = [5 1; -3 3];

eta = 0.00000001;
Const = [];

A = A0 + A1*x1 + A2*x2;
B = B0 + B1*x1 + B2*x2;
C = C0 + C1*x1 + C2*x2;

M = A - lambda*B;
F = [Const, M <= -eta*eye(2); B >= eta*eye(2) ; C <= -eta*eye(2)];
optimize(F,lambda);

% minimized t
lambda = value(lambda)

% x_{i}
x1 = value(x1)
x2 = value(x2)

% matrix functions
A = A0 + A1*x1 + A2*x2
B = B0 + B1*x1 + B2*x2
C = B0 + B1*x1 + B2*x2
A - lambda*B
