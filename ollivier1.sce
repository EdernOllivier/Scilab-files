// 09/12/2019 à 11:53 d'après le schéma numérique produit avec Maple 2019 entre le 04/12/2019 et le 09/12/2019
V = 109;
dt = 1;
l = 5;
x0 = 0;
y0 = 0;
phi0 = 0;
fd = mopen(TMPDIR+'/text.txt','wt');
mfprintf(fd,'hello %s %d.\n','world',1);
mfprintf(fd,'hello %s %d.\n','scilab',2);

for i = 0:100
//for k = 0:100
// dphi/dt = tan(0.01*t)/l
phi = (tan(0.01*i)/l)*dt + phi0;
//disp(phi)
// dx/dt = V*cos(phi)
x = V*cos(phi)*dt + x0;
//plot(i,x);
//disp(x)
// dy/dt = V*sin(phi)
y = V*sin(phi)*dt + y0;
//disp(y)
plot(x,y);//,'ro');
X = [x; y; phi];
U = [V; 0.01*i];

//disp("Etat du véhicule : ")
//disp(X)
//disp("Commande : ")
//disp(U)
/*
k = 1;
phi(i, k) = phi(i);
*/
// Linear approximation done here
A = [1 ,0 ,-V*sin(phi)*dt; 0 ,1 ,V*cos(phi)*dt; 0 ,0 ,1];
B = [cos(phi)*dt, 0; sin(phi)*dt, 0; tan(0.01*i)*dt/l, V*dt/(l*cos(0.01*i)^2)];
C = [1, 0, 0; 0, 1, 0; 0, 0, 1];
Xapp = A*X +B*U;
//plot(Xapp(1,:),Xapp(2,:),'g+-');
//disp("Etat approximé du véhicule : ")
//disp(Xapp)

Y = C*X;
//disp(Y)
//end;

mfprintf(fd,'This line is built with a column vector (26:28) %d.\n',[26:28].');
mfprintf(fd,'This line is built with a row vector (26:28) %d.\n',[26:28]);
mfprintf(fd,'This line is built with a matrix %.3f.\n',Xapp);
mfprintf(fd,'This line is built with a matrix %.3f.\n',Y);
end;
mclose(fd);

//plot(x,y,'ro');
