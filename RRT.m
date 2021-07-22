%RRT implementation

clearvars
close all

%defining arena and obstacle position
x_max = 100;
y_max = 100;
obstacle = [50,15,20,20];
stp = 20; % Max step size limit
numNodes = 3000;    %maximum number of nodes    

q_start.coord = [0 0]; % start pose
q_start.cost = 0;
q_start.parent = 0;
q_goal.coord = [40 40]; % goal pose
q_goal.cost = 0;
q_near.cost = 0;

nodes(1) = q_start; %q_start is structure
figure() %figure(1)
axis([0 x_max 0 y_max]) %creates a blank plot
rectangle('Position',obstacle,'FaceColor',[0 .2 .5])
hold on
plot(q_goal.coord(1) ,q_goal.coord(2) ,'-o','Color',[1 0 0]);
hold on
 
for i = 1:1:numNodes
    q_rand = [floor(rand(1)*x_max) floor(rand(1)*y_max)]; %floor(X) rounds the elements of X to the nearest integer towards minus infinity. %rand(1) generates values between 0 and 1.
       
    % Stop if goal node is already reached
    for j = 1:1:length(nodes)
        if nodes(j).coord == q_goal.coord % nodes is a structure with subparts of coordinate, cost, parentheh node
            break
        end
    end
    
    % Finding the closest node to the new one from existing list of nodes  
    ndist = [];
    for j = 1:1:length(nodes)
        n = nodes(j);
        tmp = dist(n.coord, q_rand); 
        ndist = [ndist tmp];  % ndist array of distances of new node to all previous nodes
    end
    
    [val, idx] = min(ndist); %chosing the minimum cost distance, and storing its index value in idx
    q_near = nodes(idx); % idx th node is the final parent node of the new random node made now.
    q_new.coord = move(q_rand, q_near.coord, val, stp);
    
    if noCollision(q_rand, q_near.coord, obstacle) 
    %if Final_Collision(q_rand, q_near.coord, obstacle)==1
        line([q_near.coord(1), q_new.coord(1)], [q_near.coord(2), q_new.coord(2)], 'Color', 'k', 'LineWidth', 2);
        drawnow
        hold on
        q_new.cost = dist(q_new.coord, q_near.coord) + q_near.cost;
        %q_near.cost = dist(q_new.coord, q_near.coord) + q_near.cost;
        
        % Storing parent node of the new node
        for j = 1:1:length(nodes)
            if nodes(j).coord == q_near.coord
                q_new.parent = j;
            end
        end
        
        % Append to nodes list with the new node
          nodes = [nodes q_new];
     
        
        q_near.cost = q_new.cost;
    end
end 