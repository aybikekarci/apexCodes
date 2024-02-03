/* NULL Pointer Exception */ 

   integer a;

try{
    integer b=a+1;

}catch(NullPointerException e){
    system.debug('an exception caught:'+ e.getMessage());
}finally{
    system.debug('please save your change . connection will be interrupted');
}

/* MATH Exception */

integer x = 100;
integer y = 0;

try{
    integer z=x/y;
    system.debug(z);
} catch(MathException e){ /* Normally it is written only in exception, but we wrote it like this to describe a specific error. */
    system.debug('there is a math exception please check your input'+' ' + e.getMessage());
}
