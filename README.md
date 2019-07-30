# Star Wars - agregados

## Galaxia

Agregar un objeto que represente a la galaxia. De este objeto nos va a interesar únicamente el _nivel básico de energía_, un valor numérico que arranca de 3.


## Agregados al planeta

Se agrega para cada planeta, la _cantidad de edificios_ que se han construido, valor que arranca en 0.

Se pide agregar las siguientes consultas sobre un planeta:
- _indice de construcción_ : es el resultado de sumar la cantidad de kilómetros de murallas, más la cantidad de museos multiplicada por 30, más la cantidad de edificios construidos multiplicada por 10.
- _es copado_: se verifica si el planeta es culto y además tiene más de 4 habitantes.
- _está bien defendido_: se verifica si la suma de su nivel inicial de defensa más el nivel básico de energía de la galaxia es de 8 o más.


## Publicaciones

Agregar al modelo las **publicaciones**, que serán usadas más adelante. De cada publicación debe ser posible consultar:
- su _tema_ que es un String, p.ej. "Motores".
- la cantidad de _inteligencia_ que aporta a una persona.
- si _es útil para la defensa_ o no.
- el _valor global_ de la publicación.

Entre las publicaciones debemos contemplar los **manuales** y las **novelas**.

Repecto de los manuales: el tema se establece para cada uno, aportan 5 puntos de inteligencia, se especifica para cada uno si es o no útil para la defensa. El valor global es 10 si es útil para la defensa, 4 en caso contrario.

Para las novelas: el tema es fijo "Literatura", para cada uno se establece cuánta nteligencia aporta, no son útiles para la defensa. El valor global es el doble de la cantidad de inteligencia que aporta.


## Técnicos

Agregar un nuevo tipo específico de personas, los **técnicos**. 
Para cada técnico, se conocen las _publicaciones_ que maneja. 

La _inteligencia_ de un técnico se obtiene sumando, al valor común para todas las personas, la suma del aporte de cada publicación que maneja.

La _potencia_ de un técnico se obtiene sumando, al valor común para todas las personas, la cantidad de publicaciones que maneja que son útiles para la defensa.

El _tributo_ de un técnico para un planeta, consiste en construir un edificio en el mismo.

Un técnico _es destacado_ si además de cumplirse la condición común a todas las personas, maneja tres o más publicaciones.

También debe ser posible resolver las siguientes consultas para un técnico:
- si _sabe de un tema_: la condición es que tenga al menos una publicación de ese tema.
- el _material sobre un tema_, que es la colección de las publicaciones que maneja sobre ese tema.
- el _material menos útil_, que es el que le aporta menos inteligencia.

Finalmente, se tiene que permitir que un técnico A le _pase material_ a otro B: la acción consiste en que A le done a B el material menos útil entre los que maneja. Este material no debe estar más entre los que maneja A, y sí debe estar entre los que maneja B.


## Agricultores

Agregar un nuevo tipo específico de personas, los **agricultores**.  Para cada uno se sabe si _sabe sobre riego_ o no, y los _años de experiencia_.

La _inteligencia_ de un agricultor se define como sus años de experiencia, excepto si sabe sobre riego, en cuyo caso es el doble de ese valor.

La _potencia_ de un agricultor es de 5 puntos.

El _tributo_ de un agricultor para un planeta, es ... no hacer nada.

Un agricultor _es destacado_ si cumple la condición común a todas las personas, o bien sabe sobre riego y tiene 5 o más años de experiencia.

Debe contemplarse la acción de _acumular experiencia_, indicando la cantidad de años: esta cantidad debe sumarse a los años de experiencia del agricultor.

**OJO**  
Ni para la inteligencia ni para la potencia debe sumarse el valor común para todas las personas.

## Habitantes útiles

Decimos que una persona _es útil_ para un planeta. Las condiciones son:
- atletas: si el planeta necesita reforzarse.
- docentes: si el planeta no es culto.
- soldados: si la potencia real es menor a 40.
- técnicos: si el planeta tiene 3 o más habitantes.
- agricultor: siempre son útiles.

Agregar la posibilidad de consultarle a un planeta los _habitantes útiles_, que es la colección de aquellos entre sus habitantes que son útiles para ese mismo planeta.


## Test sobre agricultores
Crear a Irma, una agricultora de 28 años, con 3 años de experiencia y que no sabe sobre riego.
Verificar que la inteligencia de Irma es 3, la potencia es 5, y que no es destacada.

Después, hacer que Irma sepa sobre riego.
Verificar que su inteligencia subió a 6, y que sigue sin ser destacada.

Finalmente, hacer que Irma acumule 4 años de experiencia.
Verificar que su inteligencia subió a 14, que ahora sí es destacada, y que su potencia sigue en 5.


## Test sobre técnicos
Considerar los siguientes materiales:
- `man1`: manual sobre motores, que es útil para la defensa.
- `man2`: manual sobre electrónica, que es útil para la defensa.
- `man3`: manual sobre jardinería, que no es útil para la defensa.
- `man4`: manual sobre electrónica, este no es útil para la defensa.
- `nove1`: novela que aporta 3 puntos de inteligencia.
- `nove2`: novela que aporta 12 puntos de inteligencia.

Crear a Nuria y Silvia, dos técnicas. Nuria tiene 25 años y maneja man1, man2, man4 y nove1; Silvia tiene 43 años y maneja man3 y nove2.
Crear al planeta Tritón.
Hacer que Nuria y Silvia le ofrezcan su tributo a Tritón.

Después de todo esto, verificar que:
- la inteligencia de Nuria es 30, la de Silvia es 25.
- la potencia de Nuria es 30, la de Silvia es 20.
- Nuria sabe de motores y electrónica, no de jardinería. Silvia al revés: sabe de jardinería, pero no sabe ni de motores ni de electrónica. Ambas saben de literatura.
- el material menos útil de Nuria es nove1, el de Silvia es man3.
- Tritón tiene 2 edificios y ningún museo.

