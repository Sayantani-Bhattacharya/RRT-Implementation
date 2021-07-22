% if points A B and C are joined then is the rotation cloclwise or anticlockwise
 
function val = ccw(A,B,C)

%A,B,C position vectors with x and y  coordinates
    val = (C(2)-A(2)) * (B(1)-A(1)) > (B(2)-A(2)) * (C(1)-A(1));
end