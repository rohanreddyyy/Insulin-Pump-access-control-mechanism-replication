    data = table2array(Bolusdataset);
    timelabel = input('Time label: ');
    BG_input = input('BG_input: ');
    Carb_input = input('Carb_input: ');
    Bolus_selected = input('Bolus_selected: ');
    
    [Mdl, MSE, X_userinput] = trainer(data, timelabel, BG_input, Carb_input);
    Estimated_Bolus = predict(Mdl, X_userinput);
    
    SR_low = Estimated_Bolus - 2*sqrt(MSE);
    SR_high = Estimated_Bolus + 2*sqrt(MSE);
    SR = [SR_low SR_high];
    disp(SR)
    if Bolus_selected < SR_low || Bolus_selected > SR_high
    O = 'Fail';
    else
    O = 'Pass';
    end
    disp(O)
