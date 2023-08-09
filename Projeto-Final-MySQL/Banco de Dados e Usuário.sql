-- Criação do Banco de Dados:
create database projetosebovitoria;

-- Criação do Usuário:
create user 'administrador_sv'@'localhost' identified by 'administradorsv01';
grant all privileges on projetosebovitoria.* to administrador_sv@localhost;
