handleHeight = 85;
handleBaseDia = 45;
handleTopDia = 15;

m = 0;
mode = (m == 1) ? "handle":
       (m == 2) ? "base":
       (m == 3) ? "retainer":
       "full";
       
q=0;
$fn = (q==0)? 100 : q;