function [smoothValue] = smoothness(dataPoints)
    tt = 1:length(dataPoints);
    
    %polyCurve = polyfit(dataPoints,tt,5); %for now
    
    %plot(tt,dataPoints);
    %hold on;
    
    %polyCurveVals = polyval(polyCurve,tt); 
    %plot(1:length(polyCurveVals),polyCurveVals);
    %axis([0,length(dataPoints),min(dataPoints),max(dataPoints)]);
    
    %deriv1 = polyderiv(polyCurve);
    %deriv2 = polyderiv(deriv1);
    
    %deriv2_squared = polyval(deriv2,tt).^2;
    
    %cumulValue = cumsum(deriv2_squared);
    
    %smoothValue = cumulValue(end);
    
    diffValue = diff(dataPoints);
    diffValue_abs = abs(diffValue);
    
    cumulValue = cumsum(diffValue_abs);
    smoothValue = cumulValue(end);
    
end
