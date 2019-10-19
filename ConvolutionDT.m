function[] = conv_DT(name)
s1='Part1';
s2='Part2';
s3='Part3';
n=linspace(-1,20,21000);
y=zeros(size(n));
 
if strcmp(name,s1)
    x=((0.8).^n).*unitstep(n,1);
    h=((0.3).^n).*unitstep(n,1);
elseif strcmp(name,s2)
    x=unitstep(n,1)-unitstep(n-8,1);
    h=sin(pi*n/4).*(unitstep(n,1)-unitstep(n-8,1));
elseif strcmp(name,s3)
    x=exp(-n).*unitstep(n,1);
    h=((2).^-n).*unitstep(n,1);
else
    fprintf('Enter name properly.\n');
    return
end
 
 
for i=1:length(x)
    y(i)=0;
    for k=1:i-1
        y(i)=y(i)+x(k)*h(i-k);
    end
end
y1=conv(x,h);
subplot(4,1,1);
plot(n,x);
title('x(t)');
subplot(4,1,2);
plot(n,h(1:length(n)));
title('h(t)');
subplot(4,1,3);
plot(n,y);
title('y(t)');
subplot(4,1,4);
plot(n,y1(1:length(n)));
title('y(t) using library function');










