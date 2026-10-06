% CODE FOR CALCULATING HEAD OVER WEIR:

disp("TYPE: 'TRIANGULAR' OR 'RECTANGULAR' ")
Type = input("TYPE OF WEIR: ","s");

if Type == "TRIANGULAR"
    Flow_Rate = input("FLOW RATE: ");
    Number_Of_Weirs = input("NUMBER OF WEIRS: ");
    constant = 1.38;
    Flow_Per_Weir = (Flow_Rate/Number_Of_Weirs);
    Head_Over_Weir = ((Flow_Per_Weir)/(1.38))^(1/2.5);
    SrNo = [1;2;3;4];
    Paramters = [" FLOW RATE ";" NUMBER OF WEIR ";" FLOW PER WEIR ";" HEAD OVER WEIR "];
     Design = [sprintf("%.3f",Flow_Rate);Number_Of_Weirs;sprintf("%.3f",Flow_Per_Weir);sprintf("%.3f",Head_Over_Weir)];
    Units = [" m3/s ";" qty ";" m3/s ";" m "];
    Table = table(SrNo,Paramters,Design,Units);
    disp(Table);

elseif Type == "RECTANGULAR" 
    Flow_Rate = input("FLOW RATE: ");
    Number_Of_Weirs = input("NUMBER OF WEIRS: ");
    Length = input("LENGTH OF WEIR: ");
    constant = 1.84;
    Flow_Per_Weir = (Flow_Rate/Number_Of_Weirs);
    Head_Over_Weir = ((Flow_Per_Weir)/(1.84*Length))^(1/1.5);
    SrNo = [1;2;3;4;5];
    Paramters = [" FLOW RATE ";" LENGTH OF WEIR ";" NUMBER OF WEIR ";" FLOW PER WEIR ";" HEAD OVER WEIR "];
    Design = [sprintf("%.3f",Flow_Rate);Length;Number_Of_Weirs;sprintf("%.3f",Flow_Per_Weir);sprintf("%.3f",Head_Over_Weir)];
    Units = [" m3/s ";" m ";" qty ";" m3/s ";" m "];
    Table = table(SrNo,Paramters,Design,Units);
    disp(Table);

else 
    disp("ERROR")

end
