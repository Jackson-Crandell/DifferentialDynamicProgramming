function [x] = fnsimulate(xo,u_new,Horizon,dt,sigma)

global g; 
global m_c;
global m_p; 
global l;


x = xo;

for k = 1:(Horizon-1)

          
      Fx(1,2) = x(2,k); 
      Fx(3,4) = x(4,k);
      Fx(2,3) = l*m_p*(x(4,k)).^2*cos(x(3,k))*(m_c + m_p*sin(x(3,k)).^2 - m_p*sin(x(2,k))*cos(x(3,k))*sin(x(3,k))) / (m_c + m_p*sin(x(3,k))).^2 + ...
          g(-sin(x(3,k))*(m_c + m_p*sin(x(3,k)).^2)-m_p*sin(2*x(3,k))*cos(x(3,k))) / (m_c + m_p*sin(x(3,k)).^2);
      
      Fx(2,4) = -2*m_p*sin(x(3,k))*l*x(4,k) / (m_c + m_p*sin(x(3,k)).^2);
      Fx(4,3) = -((-m_p*l*x(4,k).^2*cos(x(3,k))*sin(x(3,k)))*(2*l*m_p*sin(x(3,k))*cos(x(3,k)))) / (l*(m_c + m_p *sin(x(3,k)).^2));
      Fx(4,4) = -2 * m_p*x(4,k)*sin(2*x(3,k))/ (m_c + m_p *sin(x(3,k)).^2);
         
      G_x(2,1) = 1/(m_c + m_p*sin(x(3,k)).^2);
      G_x(4,1) = -cos(x(3,k))/(l*(m_c + m_p *sin(x(3,k)).^2));
      


x(:,k+1) = x(:,k) + Fx * dt + G_x * u_new(:,k) * dt  + G_x * u_new(:,k); %* sqrt(dt) * sigma * randn ;
end