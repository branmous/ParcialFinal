CREATE OR REPLACE FUNCTION CALCULAR_CAJAS_NECESARIAS(num_Item IN NUMBER,cajas_grandes IN NUMBER,cajas_pequnas IN NUMBER) 
   RETURN NUMBER 
   IS despachar NUMBER;
   valueroundCG number;
   totalgrandes number;
   faltante number;
   BEGIN 
   valueroundCG := ROUND(num_Item/5);
   if valueroundCG <= cajas_grandes then
    totalgrandes := 5*valueroundCG;
    faltante := num_Item-totalgrandes;
   else
    faltante := num_Item;
   end if;
   
   if faltante = 0 then
     despachar := totalgrandes;
   end if;
   if faltante > cajas_pequnas or faltante < 0 then
    despachar := -1;   
   end if;
   if faltante <= cajas_pequnas AND faltante > 0 then
    despachar := valueroundCG + faltante;       
   end if;      
      RETURN(despachar); 
    END;