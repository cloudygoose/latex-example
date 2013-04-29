clear all
close all
clc
x=-1:0.1:1;
y=-1:0.1:1;

alpha=0.02;

[X Y] = meshgrid(x,y);
Z = exp(X+3.*Y-0.1)+exp(X-3.*Y-0.1)+exp(-X-0.1);

surf(X,Y,Z,'FaceAlpha','flat','AlphaDataMapping','scaled','AlphaData',gradient(Z))
hold on;
colormap(gray);
meshgrid off


x0 = zeros(1000,2);

%x0(1,:) = randint(1,2,10);
x0(1,:) = [1 1];
x0(1,:)
plot3(x0(1,1),x0(1,2), fd(x0),'m*','MarkerSize',20);

i=2;
while(1)
    pause
    % Gradient descent equation..
    x0(i,:) = x0(i-1,:) - alpha.*2.*(x0(i-1,:));
    x0(i,:)
    plot3(x0(i,1),x0(i,2),(x0(i,1).^2 + x0(i,2).^2),'m*','MarkerSize',20)
    i=i+1;    
end