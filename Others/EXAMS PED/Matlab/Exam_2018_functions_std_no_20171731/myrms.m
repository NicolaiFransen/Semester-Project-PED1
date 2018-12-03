function [ rms_value ] = myrms( vector )
%problem9
%vector=cos(2*pi*(1:100)/100)
%rms(vector)
n=length(vector);

for i=1:1:n
Vector2(i)=(vector(i))^2;
end
a=sum(Vector2);
rms_value=sqrt((1/n)*a);
end

