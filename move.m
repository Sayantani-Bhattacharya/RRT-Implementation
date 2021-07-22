function A = move(qr, qn, val, stp)
   qnew = [0 0];
   
   % move towards qn with maximum step size of stp
   % val is the distance between q_rand and nearest node (q_near)
   if val >= stp
       qnew(1) = qn(1) + ((qr(1)-qn(1))*stp)/dist(qr,qn);
       qnew(2) = qn(2) + ((qr(2)-qn(2))*stp)/dist(qr,qn);
   else
       qnew(1) = qr(1);
       qnew(2) = qr(2);
   end   
   A = [qnew(1), qnew(2)];
end