function [Mdl, MSE, X_userinput]= trainer(data, timelabel, BG_input, Carb_input)

X = data(1:size(data,1)-360, 1:size(data,2)-1);
Y = data(1:size(data,1)-360, size(data,2));
X_test = data(size(data,1)-359:size(data,1), 1:size(data,2)-1);
Y_test = data(size(data,1)-359:size(data,1), size(data,2));
X_userinput = [timelabel BG_input Carb_input X(1,4) X(1,5) X(1,6) X(1,7) X(1,8)];
Mdl = fitrsvm(X,Y);
Y_testpredict = predict(Mdl, X_test);
M = sum((Y_testpredict - Y_test).^2);
MSE = M/size(Y_testpredict, 1)
m = size(Y_test, 1);
s = (m*sum(Y_testpredict.*Y_test) - sum(Y_testpredict)*sum(Y_test))^2;
d = ((m*sum(Y_testpredict.^2))-(sum(Y_testpredict)^2))*(m*sum(Y_test.^2)-(sum(Y_test)^2));
scc = s/d
end