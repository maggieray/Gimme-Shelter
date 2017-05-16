%	$Id: step.pl,v 1.1 2008/10/14 22:33:16 mbar098 Exp $	

/*  step(OpName, Bindings) the step data structure
    ===============================================
       
    
*/    
stepOp(step(OpName,_), OpName).

stepBindings(step(_, Bindings), Bindings).
