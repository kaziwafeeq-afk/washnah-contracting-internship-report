% MATLAB CODE FOR HEAD LOSS CALCULATION:

% USER INPUT PARAMETERS:

% FLOW RATE TAKEN IN CUBIC METER PER DAY:
Average_FLow1 = input("AVERAGE FLOW: ");
Average_Flow2 = Average_FLow1/(24*60*60);

% FLOW RATE TAKEN IN CUBIC METER PER DAY:
Peak_Flow1 = input("PEAK FLOW: ");
Peak_Flow2 = Peak_Flow1/(24*60*60);

% DIAMETER TAKEN IN METERS: 
Diameter = input("DIAMETER: ");

% AREA IN METER SQUARE:
Radius = Diameter/2;
Area = pi*(Radius^2);

% VELOCITY:
Peak_Velocity = Peak_Flow2/Area;
Average_Velocity = Average_Flow2/Area;

% KINEMATIC VISCOSITY:
Kinematic_Viscocity = input("KINEMATIC VISCOCITY: ");

% REYNOLDS NUMBER:
Peak_Reynolds_Number = (Peak_Velocity*Diameter)/Kinematic_Viscocity;
Average_Reynolds_Number = (Average_Velocity*Diameter)/Kinematic_Viscocity;

% ROUGHNESS OF PIPE IN METERS:
ROUGHNESS_OF_PIPE = input("ROUGHNESS OF PIPE: ");

% PIPE LENGTH IN METERS:
Length_Of_Pipe = input("LENGTH OF PIPE: ");

% TYPE OF PIPES:
Number_Of_90_Degree_Elbows = input("ENTER THE NUMBER OF 90 DEGREE ELBOWS: ");
Number_Of_45_Degree_Elbows = input("ENTER THE NUMBER OF 45 DEGREE ELBOWS: ");
Number_Of_Exit_Square = input("NUMBER OF EXIT SQUARES: ");
Number_Of_ENTRANCE_Square = input("NUMBER OF ENTRANCE SQUARES: ");

% FRICTION FACTOR:
f_trail = input("FRICTION FACTOR BY TRAIL: ");
syms f
eqn = 1/(f^0.5) == -2*log10((ROUGHNESS_OF_PIPE/(3.7*Diameter))+(2.51/(Peak_Reynolds_Number*(f_trail^0.5))));
s = solve(eqn,f);

% HEAD LOSS CALCULATION:
Head_Loss_Peak = ((Peak_Velocity^2)/(2*9.81))*(((vpa(s)*Length_Of_Pipe)/Diameter)+(0.3*Number_Of_90_Degree_Elbows)+(0.25*Number_Of_45_Degree_Elbows)+(1*Number_Of_Exit_Square)+(0.5*Number_Of_ENTRANCE_Square));
Head_Loss_Average = ((Average_Velocity^2)/(2*9.81))*(((vpa(s)*Length_Of_Pipe)/Diameter)+(0.3*Number_Of_90_Degree_Elbows)+(0.25*Number_Of_45_Degree_Elbows)+(1*Number_Of_Exit_Square)+(0.5*Number_Of_ENTRANCE_Square));

% DISPLAY VALUES:
SrNo = [1.;2.;3.;4.;5.;6.;7.;8.;9.;10.;11.;12.;13.];
Parameters = [" FLOW ";" DIAMETER ";" RADIUS ";" VELOCITY ";" REYNOLDS NUMBER ";" ROUGHNESS OF PIPE ";" LENGTH OF PIPE ";" NUMBER OF 90 DEGREE ELBOWS ";" NUMBER OF 45 DEGREE ELBOWS ";" NUMBER OF EXIT SQUARES ";" NUMBER OF ENTRANCE SQUARES ";" FRICTION FACTOR ";" HEAD LOSS "];
Design = [sprintf("%.3f",vpa(Peak_Flow2));sprintf("%.3f",vpa(Diameter));sprintf("%.3f",vpa(Radius));sprintf("%.3f",vpa(Peak_Velocity));sprintf("%.3f",vpa(Peak_Reynolds_Number));sprintf("%.3f",vpa(ROUGHNESS_OF_PIPE));sprintf("%.3f",vpa(Length_Of_Pipe));vpa(Number_Of_90_Degree_Elbows);vpa(Number_Of_45_Degree_Elbows);vpa(Number_Of_Exit_Square);vpa(Number_Of_ENTRANCE_Square);sprintf("%.3f",vpa(s));sprintf("%.3f",vpa(Head_Loss_Peak))];
Peak = [sprintf("%.3f",vpa(Peak_Flow2));sprintf("%.3f",vpa(Diameter));sprintf("%.3f",vpa(Radius));sprintf("%.3f",vpa(Peak_Velocity));sprintf("%.3f",vpa(Peak_Reynolds_Number));sprintf("%.3f",vpa(ROUGHNESS_OF_PIPE));sprintf("%.3f",vpa(Length_Of_Pipe));vpa(Number_Of_90_Degree_Elbows);vpa(Number_Of_45_Degree_Elbows);vpa(Number_Of_Exit_Square);vpa(Number_Of_ENTRANCE_Square);sprintf("%.3f",vpa(s));sprintf("%.3f",vpa(Head_Loss_Peak))];
Average = [sprintf("%.3f",vpa(Average_Flow2));sprintf("%.3f",vpa(Diameter));sprintf("%.3f",vpa(Radius));sprintf("%.3f",vpa(Average_Velocity));sprintf("%.3f",vpa(Average_Reynolds_Number));sprintf("%.3f",vpa(ROUGHNESS_OF_PIPE));sprintf("%.3f",vpa(Length_Of_Pipe));vpa(Number_Of_90_Degree_Elbows);vpa(Number_Of_45_Degree_Elbows);vpa(Number_Of_Exit_Square);vpa(Number_Of_ENTRANCE_Square);sprintf("%.3f",vpa(s));sprintf("%.3f",vpa(Head_Loss_Average))];
units = ["m3/day";"m";"m";"m/s";"unitless";"m";"m";"qty";"qty";"qty";"qty";"unitless";"m"];
Table = table(SrNo,Parameters,Design,Peak,Average,units);
disp(Table);
