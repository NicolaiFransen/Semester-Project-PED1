% function y = percentPassed(grades)
% %returns the failure percentage
%     percent = 0;
%     for i=1:length(grades)
%         if(grades(i)>0)
%             percent = percent + 1;
%         end
%     end
%     percent = percent / length(grades);
%     y = percent;
% end
% 
% optHeight1 = Height1(totalArea1 == min(totalArea1))
% optRadius1 = Radius(totalArea1 == min(totalArea1))
% optHeight2 = Height2(totalArea2 == min(totalArea2))
% optRadius2 = Radius(totalArea2 == min(totalArea2))


function y = percentPassed(grades)
%returns the failure percentage
    y = sum(grades>0) / length(grades);
end
