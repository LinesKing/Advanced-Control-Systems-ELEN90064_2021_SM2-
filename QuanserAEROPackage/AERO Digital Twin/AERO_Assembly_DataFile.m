% Simscape(TM) Multibody(TM) version: 7.2

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(13).translation = [0.0 0.0 0.0];
smiData.RigidTransform(13).angle = 0.0;
smiData.RigidTransform(13).axis = [0.0 0.0 0.0];
smiData.RigidTransform(13).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [75 240 -4.4408920985006262e-15];  % mm
smiData.RigidTransform(1).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(1).axis = [5.5511151231257809e-17 1 5.5511151231257809e-17];
smiData.RigidTransform(1).ID = 'B[AERO - Fork:1:-:AERO - Arm:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [0 0 72.5];  % mm
smiData.RigidTransform(2).angle = 0;  % rad
smiData.RigidTransform(2).axis = [0 0 0];
smiData.RigidTransform(2).ID = 'F[AERO - Fork:1:-:AERO - Arm:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [53.000000000000007 0 0];  % mm
smiData.RigidTransform(3).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(3).axis = [-0 -1 -0];
smiData.RigidTransform(3).ID = 'B[AERO - Arm:1:-:AERO - Propeller Housing:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-2.6795207310774863e-14 10 -95.513710374932856];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [1 0 0];
smiData.RigidTransform(4).ID = 'F[AERO - Arm:1:-:AERO - Propeller Housing:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [-53.000000000000007 0 0];  % mm
smiData.RigidTransform(5).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(5).axis = [0.70710678118654746 0 0.70710678118654757];
smiData.RigidTransform(5).ID = 'B[AERO - Arm:1:-:AERO - Propeller Housing:2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [-2.6795207310774863e-14 10 -95.513710374932856];  % mm
smiData.RigidTransform(6).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(6).axis = [1 0 0];
smiData.RigidTransform(6).ID = 'F[AERO - Arm:1:-:AERO - Propeller Housing:2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 90 0];  % mm
smiData.RigidTransform(7).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(7).axis = [-0.57735026918962584 -0.57735026918962584 -0.57735026918962584];
smiData.RigidTransform(7).ID = 'B[AERO - Base:1:-:AERO - Fork:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [0 -10.000000000000002 -1.8369701987210304e-15];  % mm
smiData.RigidTransform(8).angle = 1.5707963267948966;  % rad
smiData.RigidTransform(8).axis = [-1 0 0];
smiData.RigidTransform(8).ID = 'F[AERO - Base:1:-:AERO - Fork:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [0 7 0];  % mm
smiData.RigidTransform(9).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(9).axis = [-1 1.5327705936981187e-16 1.5327705936981187e-16];
smiData.RigidTransform(9).ID = 'B[AERO - Propeller Housing:1:-:AERO - Propeller:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(10).translation = [0 2 0];  % mm
smiData.RigidTransform(10).angle = 1.6664335535985486;  % rad
smiData.RigidTransform(10).axis = [-0.90866085456602608 0.29524180884432621 0.29524180884432621];
smiData.RigidTransform(10).ID = 'F[AERO - Propeller Housing:1:-:AERO - Propeller:1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(11).translation = [0 7 0];  % mm
smiData.RigidTransform(11).angle = 1.5707963267948968;  % rad
smiData.RigidTransform(11).axis = [-1 6.2505120410571602e-17 6.2505120410571602e-17];
smiData.RigidTransform(11).ID = 'B[AERO - Propeller Housing:2:-:AERO - Propeller:2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(12).translation = [0 2 0];  % mm
smiData.RigidTransform(12).angle = 2.2843286751900402;  % rad
smiData.RigidTransform(12).axis = [-0.45696631166862733 -0.62896016964509405 -0.62896016964509394];
smiData.RigidTransform(12).ID = 'F[AERO - Propeller Housing:2:-:AERO - Propeller:2]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(13).translation = [-4.2138363460867243 -51.619496793960629 8.8817841970012523e-15];  % mm
smiData.RigidTransform(13).angle = 0;  % rad
smiData.RigidTransform(13).axis = [0 0 0];
smiData.RigidTransform(13).ID = 'SixDofRigidTransform[AERO - Base:1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(5).mass = 0.0;
smiData.Solid(5).CoM = [0.0 0.0 0.0];
smiData.Solid(5).MoI = [0.0 0.0 0.0];
smiData.Solid(5).PoI = [0.0 0.0 0.0];
smiData.Solid(5).color = [0.0 0.0 0.0];
smiData.Solid(5).opacity = 0.0;
smiData.Solid(5).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 2.3646013590087778;  % kg
smiData.Solid(1).CoM = [5.2411111737809946e-10 37.953212977613504 0];  % mm
smiData.Solid(1).MoI = [7187.7324830007356 11870.338504388217 7187.7324675234859];  % kg*mm^2
smiData.Solid(1).PoI = [0 0 -5.8082727144378374e-08];  % kg*mm^2
smiData.Solid(1).color = [0.019607843137254902 0.019607843137254902 0.019607843137254902];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'AERO - Base.ipt_{5B170AF7-4835-771C-6ADF-04BDBD784493}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 0.83305794936159261;  % kg
smiData.Solid(2).CoM = [2.6616972860311175e-11 94.887662204331122 1.476597858637033e-12];  % mm
smiData.Solid(2).MoI = [5303.1260884967096 5291.939632575255 10383.120541726365];  % kg*mm^2
smiData.Solid(2).PoI = [-1.7831956653812282e-10 1.2005330063405928e-10 2.2160395060760428e-09];  % kg*mm^2
smiData.Solid(2).color = [0.019607843137254902 0.019607843137254902 0.019607843137254902];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'AERO - Fork.ipt_{19DEB560-4DA8-F02E-E9C0-369FCF880C44}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 0.26803684677336304;  % kg
smiData.Solid(3).CoM = [1.4217129600648017e-09 -5.1965980940643155e-10 0];  % mm
smiData.Solid(3).MoI = [365.29210547402909 461.18513674035563 151.85502279018394];  % kg*mm^2
smiData.Solid(3).PoI = [9.0949470177292829e-14 -7.5851858127862215e-10 0];  % kg*mm^2
smiData.Solid(3).color = [0.019607843137254902 0.019607843137254902 0.019607843137254902];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'AERO - Arm.ipt_{15B1D815-460D-A329-2F9F-5FB9E93ED37B}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 0.12383177107043668;  % kg
smiData.Solid(4).CoM = [0.0017719529705504358 5.4550389866945963 -8.6087796874497933];  % mm
smiData.Solid(4).MoI = [310.70143145161387 411.71544948269155 138.60060892702214];  % kg*mm^2
smiData.Solid(4).PoI = [4.844910656824843 -0.14683986965912996 -0.0010036332207252452];  % kg*mm^2
smiData.Solid(4).color = [0.019607843137254902 0.019607843137254902 0.019607843137254902];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'AERO - Propeller Housing.ipt_{180F9119-4C93-59E3-A88D-3BA97F46F3C3}';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(5).mass = 0.020642549722058069;  % kg
smiData.Solid(5).CoM = [-1.0654070864969649e-12 5.0957557065841854 -2.1081925156778982e-11];  % mm
smiData.Solid(5).MoI = [13.821663896067577 27.27728691223324 13.82166389742846];  % kg*mm^2
smiData.Solid(5).PoI = [0 0 -9.3993314912803545e-14];  % kg*mm^2
smiData.Solid(5).color = [0.12156862745098039 0.12156862745098039 0.70588235294117652];
smiData.Solid(5).opacity = 1;
smiData.Solid(5).ID = 'AERO - Propeller.ipt_{54ECD9B7-47A0-F6BB-CE8E-F5BB4731363E}';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(6).Rz.Pos = 0.0;
smiData.RevoluteJoint(6).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = 8.5443305009495346e-10;  % deg
smiData.RevoluteJoint(1).ID = '[AERO - Fork:1:-:AERO - Arm:1]';

smiData.RevoluteJoint(2).Rz.Pos = 176.89402341881481;  % deg
smiData.RevoluteJoint(2).ID = '[AERO - Arm:1:-:AERO - Propeller Housing:1]';

smiData.RevoluteJoint(3).Rz.Pos = 3.1059765811798905;  % deg
smiData.RevoluteJoint(3).ID = '[AERO - Arm:1:-:AERO - Propeller Housing:2]';

smiData.RevoluteJoint(4).Rz.Pos = -4.7323474815586196e-11;  % deg
smiData.RevoluteJoint(4).ID = '[AERO - Base:1:-:AERO - Fork:1]';

smiData.RevoluteJoint(5).Rz.Pos = -5.8906678506533037e-05;  % deg
smiData.RevoluteJoint(5).ID = '[AERO - Propeller Housing:1:-:AERO - Propeller:1]';

smiData.RevoluteJoint(6).Rz.Pos = -3.6425016675276188e-05;  % deg
smiData.RevoluteJoint(6).ID = '[AERO - Propeller Housing:2:-:AERO - Propeller:2]';

