CREATE OR REPLACE FUNCTION CALCULAR_CAJAS_NECESARIAS(num_Item IN NUMBER,cajas_grandes IN NUMBER,cajas_pequnas IN NUMBER) 
   RETURN NUMBER 
   IS despachar NUMBER(11,2);
   valueroundCG number;
   totalgrandes number;
   faltante number;
   BEGIN 
   valueroundCG := ROUND(num_Item/5) -1;
   if valueroundCG <= cajas_grandes then
    totalgrandes := 5*valueroundCG;
    faltante := num_Item-totalgrandes;
   else
    faltante := num_Item;
   end if;
   
   if faltante = 0 then
     despachar := 1;
   end if;
   if faltante > cajas_pequnas then
    despachar := -1;   
   end if;
   if faltante <= cajas_pequnas then
    despachar := 1;   
   end if;      
      RETURN(despachar); 
    END;