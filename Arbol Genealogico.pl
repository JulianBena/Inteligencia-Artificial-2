/* Axiomas---------------------------------------------------------*/
/* padre de -------------------------------------------------------*/
padrede("Enrique VII","Enrique VIII").
padrede("Edmundo Tudor","Enrique VII").
padrede("Owen Tudor","Edmundo Tudor").
padrede("Meredith Tudor","Owen Tudor").
padrede("Carlos VI","Catalina de Valois").
padrede("Juan Beaufort I","Juan Beaufort").
padrede("Juan Beaufort","Margarita Beaufort").
padrede("Roger Beauchamp","Margarita Beauchamp").
padrede("Ricardo de Conisburgh","Ricardo Plantagenet").
padrede("Ricardo Plantagenet","Eduardo IV").
padrede("Eduardo IV","Isabel de York").
padrede("Ralph de Neville","Cecilia Neville").
padrede("Ricardo Wydevill","Ricardo Woodville").
padrede("Ricardo Woodville","Isabel Woodville").
padrede("Pedro de Luxemburgo","Jacquetta de Luxemburgo").

/* madre de -------------------------------------------------------*/
madrede("Isabel de York","Enrique VIII").
madrede("Margarita Beaufort","Enrique VII").
madrede("Catalina de Valois","Edmundo Tudor").
madrede("Margarita Ferch","Owen Tudor").
madrede("Isable de Baviera","Catalina de Valois").
madrede("Margarita Holland","Juan Beaufort").
madrede("Margarita Beauchamp","Margarita Beaufort").
madrede("Edith Stourton","Margarita Beauchamp").
madrede("Ana Mortimer","Ricardo Plantagenet").
madrede("Joan Beaufort","Cecilia Neville").
madrede("Cecilia Neville","Eduardo IV").
madrede("Isabel Bodulgate","Ricardo Woodville").
madrede("Margarita de Baux","Jacquetta de Luxemburgo").
madrede("Jacquetta de Luxemburgo","Isabel Woodville").
madrede("Isabel Woodville","Isabel de York").

/* hombre ---------------------------------------------------------*/
hombre("Enrique VII").
hombre("Edmundo Tudor").
hombre("Owen Tudor").
hombre("Meredith Tudor").
hombre("Carlos VI").
hombre("Juan Beaufort I").
hombre("Juan Beaufort").
hombre("Roger Beauchamp").
hombre("Ricardo de Conisburgh").
hombre("Ricardo Plantagenet").
hombre("Eduardo IV").
hombre("Ralph de Neville").
hombre("Ricardo Wydevill").
hombre("Ricardo Woodville").
hombre("Pedro de Luxemburgo").

/* mujer ----------------------------------------------------------*/
mujer("Isabel de York").
mujer("Margarita Beaufort").
mujer("Catalina de Valois").
mujer("Margarita Ferch").
mujer("Isable de Baviera").
mujer("Margarita Holland").
mujer("Margarita Beauchamp").
mujer("Edith Stourton").
mujer("Ana Mortimer").
mujer("Joan Beaufort").
mujer("Cecilia Neville").
mujer("Isabel Bodulgate").
mujer("Margarita de Baux").
mujer("Jacquetta de Luxemburgo").
mujer("Isabel Woodville").



/* Reglas */
/* hermanos--------------------------------------------------------*/
hermanode(A,B):- padrede(C,A), padrede(C,B), A \== B.
hermanode(A,B):- madrede(C,A), madrede(C,B), A \== B.

/* hijos-----------------------------------------------------------*/
hijode(A,B) :- padrede(B,A).
hijode(A,B) :- madrede(B,A).

/* primos en primer grado-(primo hermano)--------------------------*/
primode(A,B):-hombre(A),padrede(C,A),padrede(D,B),hermanode(C,D).
primode(A,B):-hombre(A),padrede(C,A),madrede(D,B),hermanode(C,D).
primode(A,B):-hombre(A),madrede(C,A),madrede(D,B),hermanode(C,D).
primode(A,B):-hombre(A),madrede(C,A),padrede(D,B),hermanode(C,D).

/* primas en primer grado-(primo hermano)--------------------------*/
primade(A,B):-mujer(A),padrede(C,A),padrede(D,B),hermanode(C,D).
primade(A,B):-mujer(A),padrede(C,A),madrede(D,B),hermanode(C,D).
primade(A,B):-mujer(A),madrede(C,A),madrede(D,B),hermanode(C,D).
primade(A,B):-mujer(A),madrede(C,A),padrede(D,B),hermanode(C,D).

/* tios paternos o maternos----------------------------------------*/
tiode(A,B):-hombre(A),hermanode(A,C),padrede(C,B).
tiode(A,B):-hombre(A),hermanode(A,C),madrede(C,B).

/* tias paternas o maternas----------------------------------------*/
tiade(A,B):-mujer(A),hermanode(A,C),padrede(C,B).
tiade(A,B):-mujer(A),hermanode(A,C),madrede(C,B).

/* abuelo paterno o materno----------------------------------------*/
abuelode(A,B):-padrede(A,C), padrede(C,B).
abuelode(A,B):-padrede(A,C), madrede(C,B).

/* abuela paterna o materna----------------------------------------*/
abuelade(A,B):-madrede(A,C), padrede(C,B).
abuelade(A,B):-madrede(A,C), madrede(C,B).

/* nietos y nietas-------------------------------------------------*/
nietode(A,B):-hombre(A),abuelode(B,A).
nietode(A,B):-hombre(A),abuelade(B,A).

nietade(A,B):-mujer(A),abuelode(B,A).
nietade(A,B):-mujer(A),abuelade(B,A).

/* bisabuelos y bisabuelas-----------------------------------------*/
bisabuelode(A,B):-padrede(A,C),abuelode(C,B).
bisabuelode(A,B):-padrede(A,C),abuelade(C,B).

bisabuelade(A,B):-madrede(A,C),abuelode(C,B).
bisabuelade(A,B):-madrede(A,C),abuelade(C,B).


















