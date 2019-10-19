function[] = conv_CT(name)
s1='Part1';
s2='Part2';
syms t;
syms tau;
syms temp;
temp=t-tau;
if strcmp(name,s1)
    x=exp(-tau)*heaviside(tau);
    h1=exp(-t*2)*heaviside(t);
    h2=exp(-(t-tau)*2)*heaviside(t-tau);
    
    y=int(x*h2,tau,-inf,inf); 
   
elseif strcmp(name,s2)
    x=sin(pi*tau)*(heaviside(tau)-heaviside(tau-1.5));
    h1=(1.5)*(heaviside(t)-heaviside(t-1.5))-heaviside(t-2)+heaviside(t-2.5);
    h2=(1.5)*(heaviside(temp)-heaviside(temp-1.5))-heaviside(temp-2)+heaviside(temp-2.5);
    y=int(x*h2,tau,-inf,inf); 
else
    fprintf('Enter name properly.\n');
    return
end
figure;
%plot of x1(t)
subplot(3,1,1);
fplot(x,[-9 9]);
title('Plot of x1[t]');
xlabel('Time');
ylabel('x1(t)');
 
%plot of h1(t)
subplot(3,1,2);
fplot(h1,[-9 9]);
title('h(t)');
xlabel('Time');
ylabel('h(t)');
 
%plot of y(t)
subplot(3,1,3);
fplot(y,[-9 9]);
title('Convolution of x(t) + h(t)');
xlabel('Time');
ylabel('y(t)');





