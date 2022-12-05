/*
A NIVEL DE BD HAY 2 USUARIO:
- dbo
- guest
¿Cuando se utilizan estos 2 usuario?

*/

/*
guest
--------------------------------------------
Si esta habilitad, los logins que no tienen un usuario mapeado,
haran uso de este usuario para conectarse con la base de datos.
*/

use BOOKSTORE
go

grant connect to guest
go

grant select on publicacion to guest;

