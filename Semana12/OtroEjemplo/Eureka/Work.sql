
sp_help cliente;
go


/*

@p_codigo                                                                                                                   char                                                                                                                             no                                  5                       no                                  no                                  no                                  Modern_Spanish_CI_AS
@p_paterno                                                                                                                  varchar                                                                                                                          no                                  25                      no                                  no                                  no                                  Modern_Spanish_CI_AS
@p_materno                                                                                                                  varchar                                                                                                                          no                                  25                      no                                  no                                  no                                  Modern_Spanish_CI_AS
@p_nombre                                                                                                                   varchar                                                                                                                          no                                  30                      no                                  no                                  no                                  Modern_Spanish_CI_AS
@p_dni                                                                                                                      char                                                                                                                             no                                  8                       no                                  no                                  no                                  Modern_Spanish_CI_AS
@p_ciudad                                                                                                                   varchar                                                                                                                          no                                  30                      no                                  no                                  no                                  Modern_Spanish_CI_AS
@p_direccion                                                                                                                varchar                                                                                                                          no                                  50                      no                                  no                                  no                                  Modern_Spanish_CI_AS
@p_telefono                                                                                                                 varchar                                                                                                                          no                                  20                      yes                                 no                                  yes                                 Modern_Spanish_CI_AS
@p_email 
*/

INSERT INTO CLIENTE(chr_cliecodigo,vch_cliepaterno,vch_cliematerno,vch_clienombre,
chr_cliedni,vch_clieciudad,vch_cliedireccion,vch_clietelefono,vch_clieemail)
VALUES(@p_codigo,@p_paterno,@p_materno,@p_nombre,@p_dni,@p_ciudad,
@p_direccion,@p_telefono,@p_email) 