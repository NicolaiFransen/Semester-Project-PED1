clear all;

%5.5
a= binocdf(9,20,0.3);
sola=1-a;

b= binocdf(4,20,0.3);
solb=b;

c= binocdf(5,20,0.3);
solc= c-solb;


%5.35 hygecdf(X,M,K,N)

x0=hygepdf(0,50,10,5);
x1=hygepdf(1,50,10,5) ;
x2=hygepdf(2,50,10,5);

x0+x1+x2;

%Another way

hygecdf(2,50,10,5);


% 5.56 poisspdf(X,lambda)     poisscdf(X,lambda)

x_5a= poisspdf(5,3);
x_5b=poisscdf(5,3) - poisscdf(4,3);  %the same but using differents comands


x_3a=  poisspdf(0,3) + poisspdf(1,3) + poisspdf(2,3); %the same again
x_3b=  poisscdf(2,3);


x_2a = 1 - poisscdf(1,3);



% 5.67 


x_10= 1 - poisscdf (10,7*2)


