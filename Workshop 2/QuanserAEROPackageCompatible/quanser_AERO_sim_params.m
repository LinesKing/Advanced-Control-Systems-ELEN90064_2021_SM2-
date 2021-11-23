% ============================================================= %
%              Quanser AERO Simulation File                     %
%     Created by Vincent Liu (liuv2@student.unimelb.edu.au)     %
%       For ELEN90064 Advanced Control Systems Workshops        %
%                  Last updated: 17-07-21                       %
% ============================================================= %

% Quanser AERO default sampling period is ts = 0.002s
% You will only need to change this in Workshop 2: Discrete-time Control
ts = 0.002; 

% Total simulation time in seconds
sim_time = 30;

% Set model to 1 for pitch (1DOF) configuration or 2 for 2DOF configuration
% Defaults to 2DOF configuration
model = 1;

% Initial conditions for the system, if using 1DOF model, set psi = 0 and
% psi_dot = 0
ini_cond.theta = 0;                     % (rad)
ini_cond.theta_dot = 0;                 % (rad/s)
ini_cond.psi = 0;                       % (rad)
ini_cond.psi_dot = 0;                   % (rad/s)

% Sensor/Input noise characteristics. This is the magnitude of the
% autocorrelation function E[X(t)X(t - tau)] = sigma^2*delta(tau)
noise.motor_0 = 5e-6;
noise.motor_1 = 5e-6;
noise.pitch = 1e-8;
noise.yaw = 1e-8;
noise.pitch_vel = 2e-5;
noise.yaw_vel = 2e-5;



