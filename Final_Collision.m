% to find weather a line passes through an edge of obstacle or not

function dr = Final_Collision(n2, n1, o)
  %n2- end point of line, n1- start point of line, o - obstacle
    %A = [n1(1) n1(2)];
    %B = [n2(1) n2(2)];
    obs = [o(1) o(2) o(1)+o(3) o(2)+o(4)];  
    C1 = [obs(1),obs(2)];
    C2 = [obs(1),obs(4)];
    C3 = [obs(3),obs(4)];
    C4 = [obs(3),obs(2)];
   
    
    %to check for all edges
    
    %C1-C2
    nc1 = Collision_checker(n2, n1, C1,C2);
    %C2-C3
    nc2 = Collision_checker(n2, n1, C2,C3);
    %C3-C4
    nc3 = Collision_checker(n2, n1, C3,C4);
    %C1-C4
    nc4 = Collision_checker(n2, n1, C1,C4);
    
    if nc1==1 || nc2 ==1 || nc3 == 1 || nc4 == 1
        dr=0; % if line AB crosses any of the obstacle edge, collision happens.
    else
        dr=1; % when no collision happens
    end
    