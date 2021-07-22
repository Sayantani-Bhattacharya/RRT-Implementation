% to find weather a line passes through an edge of obstacle or not

function nc = Collision_checker(n2, n1, Ci,Cj)
  %n2- end point of line, n1- start point of line, o - obstacle
    A = [n1(1) n1(2)];
    B = [n2(1) n2(2)];
        
    
  %to check if node line intersects a edge(Ci-Cj) of the rectangle
  
  % end points of line n1-n2 are on opposite sides of edge(C1-C4) of the rectangle 
    
   c = [[1; 1]  A(:)]\B(:);                        % Calculate Parameters of line y=mx+c from 2 points on line AB
   slope_m = c(2);
   intercept_b = c(1);
   
   vol1= Ci(2) - slope_m*Ci(1) + intercept_b;  % F = y-mx+c, if the points lie on opp sides of line, then their value of F will have opposite signs.
   vol2= Cj(2) - slope_m*Cj(1) + intercept_b;
   vol3 = vol1*vol2;
   if vol3<0 
       pal=1; %collision may happen as end-point of line n1-n2 are on either sides of the edge line
   else
       pal=0;
   end
     
   %Horizontal
     % x-coordinates of n1-n2 are within range of x-coordinates of edge of the rectangle
     val1 = A(1)>= Ci(1) && A(1)<= Cj(1);
     val2 = B(1)>= Ci(1) && B(1)<= Cj(1);
     val3= val1==1 || val2==1; % at least one point within that range
     
   %Vertical  
     % y-coordinates of n1-n2 are within range of x-coordinates of edge of the rectangle
     val4 = A(2)>= Ci(2) && A(2)<= Cj(2);
     val5 = B(2)>= Ci(2) && B(2)<= Cj(2);
     val6= val4==1 || val5==1;
       
          
     if val3==1 || val6==1  
        if pal==1 
        nc = 1; %collision happens
        end 
     else
     nc = 0;   
     end
     
     
     
     % not considering the case of collinear points as it will not happen on new nodes formed.
     