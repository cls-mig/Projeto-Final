use projetosebovitoria;
set autocommit = 0;

-- Seleção:
select * from funcionario;
select * from livro;
select * from exemplar;
select * from cliente;
select * from comentario;
select * from pedido;
select * from itempedido;
select * from remessa;

-- Inserção na tabela funcionarios:
insert into funcionario (id,nome,email,senha,acesso) values (1,'Carlos Miguel','carlosmiguel7952@gmail.com','administrador01','Administrador');
insert into funcionario (id,nome,email,senha,acesso) values (2,'Gabriel Moura','gabrielm04moura@gmail.com','comum01','Comum');
insert into funcionario (id,nome,email,senha,acesso) values (3,'Thiago Henriques','thiagohenriquez378@gmail.com','admin01','Administrador');

-- Inserçäo na tabela livro:
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (1,'Engenharia de Software','Ian Sormmerville','Pearson Universidades',null,'Informática',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (2,'Engenharia de Software','Ian Sormmerville','AMGH',null,'Informática',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (3,'O Modernismo', 'Wilson Martins', 'CULTRIX',4,'Literatura',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (4,'Fahrenheit 451','Ray Bradbury','Biblioteca Azul',null,'Ficção Científica',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (5,'Revolução dos Bichos','George Orwell','Companhia das Letras',null,'Ficção',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (6,'Laranja Mecânica','Anthony Burgess','ALEPH',null,'Ficção Científica',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (7,'Engenharia de Software','Ian Sormmerville','Addison Wesley',null,'Informática',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (8,'Literatura Brasileira', 'Faraco & Moura', 'Ática',null,'Literatura',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (9,'Instalações Elétricas', 'Ademaro A.M. Bittencourt Contrim', 'McGRAW - HILL DO BRASIL',null,'Engenharia',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (10,'O Mundo de Sofia', 'Jostein Gaarder', 'SCHWARCZ S.A.',null,'Filosofia',0);
insert into livro (id,titulo,autor,editora,volume,genero,quantidade) values (11,'Uma Janela em Cobacabana', 'Luiz Alfedro Garcia-Roza', 'Companhia das Letras',null,'Ficção Policial',0);

-- Inserçäo na tabela exemplar:
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (1,1,1,null,'Bom estado',768,10,'Português',106,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (2,1,1,null,'Bom estado',768,10,'Português',101,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (3,1,1,null,'Desgastado',529,9,'Português',78,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (4,2,1,null,'Novo',704,9,'Português',82,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (5,1,1,null,'Bom estado',568,8,'Português',60,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (6,1,1,null,'Novo',578,9,'Inglês',80,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (7,1,2,'9788588639072','Bom estado',668,6,'Português',12.99,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (8,1,1,null,'Desgastado',768,5,'Português',185,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (9,1,1,null,'Desgastado',614,4,'Português',22.90,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (10,4,1,'9788535909555','Bom estado',147,3,'Português',21,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (11,3,1,'9788525052247','Seminovo',215,3,'Português',34,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (12,5,1,'9788576574460','Seminovo',292,3,'Português',30,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (13,6,1,null,'Desgastado',570,3,'Português',22.90,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (14,6,1,null,'Desgastado',554,2,'Português',18,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (15,7,2,null,'Desgastado',313,5,'Português',6,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (16,7,1,null,'Seminovo',305,4,'Português',8,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (17,8,1,null,'Bom estado',320,4,'Português',12,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (18,9,1,null,'Desgastado',277,1,'Português',10,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (19,9,1,null,'Bom estado',436,4,'Português',20.70,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (20,10,1,'9788535921892','Novo',566,1,'Português',40,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (21,11,2,null,'Bom estado',222,3,'Português',25,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (22,11,2,null,'Desgastado',243,8,'Português',12,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (23,9,1,null,'Bom estado',277,1,'Português',22,1);
insert into exemplar (id,idlivro,idfuncionario,isbn,estadoconservacao,paginas,edicao,idioma,preco,status) values (24,1,2,null,'Novo',768,10,'Português',106,1);

-- Inserção na tabela cliente:
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (1,'Carlos Miguel Vieira da Silva','2003-05-30','17367645781',null,'Rua Trindade',375,'20725150','Lins de vasconcelos','miguel036f75@gmail.com','Ab123456','ativo',67823421);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (2,'Anderson de Alnecar Barros','1990-08-20','65305156742','21967072434','Estrada Grande',251,'21941006','Galeão','andersonbarrosale@gmail.com','Cd123456','ativo',33498612);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (3,'Igor França gama','2001-01-11','67916270773','21982347734','Rua Vitório da Costa',112,'22261060','Humaitá','igorfra122@gmail.com','Ef123456','ativo',77223609);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (4,'Keyla Gomes dos Santos','1980-02-22','45563551768',null,'Rua Serafim',112,'26381732','Botafogo','keysantos5@gmail.com','Gh123456','ativo',88717930);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (5,'Leon Gonçalves Araújo','2002-02-24','26130520743','21997421618','Travessa do Campinho',43,'21730303','Realengo','leonsaraujo12@gamil.com','Jk123456','ativo',90011523);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (6,'Thiago Vinicius Gomes Santos','1987-11-04','84275815726',null,'Rua Simão Santos',110,'20930360','Cajú','thiago90vinivius@gmail.com','Mn123456','ativo',71239121);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (7,'Victor Josuan Soares de Andrade','1977-06-12','04768159761',null,'Rua do Tijolo',344,'20740570','Piedade','victtorjosuann@gmail.com','Op123456','ativo',57124431);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (8,'Edgar Gomes Filho','2004-07-07','05627345756','21989638784','Rua Simão Santos',132,'20930360','Cajú','edgargomesfilho44@gmail.com','Qr123456','ativo',21312215);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (9,'Diego Freire Abde','1959-02-10','85167172756',null,'Rua Orélia',21,'21675380','Campo Grande','diegfrei123@gmail.com','St123456','ativo',99128432);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (10,'David Marins Farias','2001-08-17','21969129744','11267200456','Haddock Lobo','14','20260130','Tijuca','davidmarins20@gmail.com','Vw123456','aguardando',72323421);
insert into cliente (id,nome,dtnascimento,cpf,celular,logradouro,numero,cep,bairro,email,senha,status,validador) values (11, 'Gabriel Moura da Silva', '2003-06-24', '18357069754', '21967072434', 'Rua Antunes Garcia ', 8, '20950060', 'Sampaio', 'gabrielm04moura@gmail.com', 'Yz123456', 'ativo', 39939394);

-- Inserção na tabela comentario:
insert into comentario (id,idcliente,mensagem,data) values (1,1,'Adorei! Tem uma grande variedade de livros, já recomendei para vários amigos.','2022-12-06');
insert into comentario (id,idcliente,mensagem,data) values (2,1,'Vocês têm um processo de compra fácil e entregam os livros rapidamente.','2023-02-13');
insert into comentario (id,idcliente,mensagem,data) values (3,7,'Eu amo a variedade de livros que vocês tem em estoque. Tem de tudo, desde clássicos até títulos mais recentes, é incrível!','2023-03-15');
insert into comentario (id,idcliente,mensagem,data) values (4,4,'Eu tenho comprado livros aqui há meses e nunca fiquei decepcionada.','2023-05-04');
insert into comentario (id,idcliente,mensagem,data) values (5,11,'Senhor, eu estou tentando comprar um livro, porém a compra não finaliza. Pode resolver o meu problema?','2023-06-14 01:44:00');

-- Inserção na tabela pedido:
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (1,8,'2022-11-04 16:05:01',1,22.90);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (2,8,'2023-01-23 09:10:45',3,241.00);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (3,2,'2023-02-01 03:15:33',1,21.00);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (4,4,'2023-02-13 05:48:23',1,30.00);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (5,6,'2023-03-03 16:33:02',2,18.00);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (6,1,'2023-03-20 22:30:06',1,82.00);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (7,3,'2023-04-15 00:01:40',4,226.00);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (8,2,'2023-05-01 18:20:19',1,82.00);
insert into pedido (numero,idcliente,dtpedido,quantidade,valor) values (9,9,'2023-05-01 19:48:03',1,20.70);

-- Inserção na tabela itempedido:
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (1,8,6,13);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (2,8,3,11);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (2,8,1,1);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (2,8,1,2);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (3,2,4,10);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (4,4,5,12);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (5,6,7,15);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (5,6,8,17);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (6,1,2,4);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (7,3,1,3);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (7,3,1,5);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (7,3,1,6);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (7,3,7,16);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (8,2,2,4);
insert into itempedido (numpedido,idcliente,idlivro,idexemplar) values (9,9,9,19);

-- Inserção na tabela remessa:
insert into remessa (numpedido,idcliente,dtenvio,codrastreio,dtentrega) values (1,8,'2022-11-08 12:04:56','SV0006BR','2022-11-08 16:31:43');
insert into remessa (numpedido,idcliente,dtenvio,codrastreio,dtentrega) values (2,8,'2023-01-27 14:20:02','SV0003BR','2022-01-27 18:27:08');
insert into remessa (numpedido,idcliente,dtenvio,codrastreio,dtentrega) values (3,2,'2023-02-07 11:11:03','SV0008BR','2023-02-07 13:30:10');
insert into remessa (numpedido,idcliente,dtenvio,codrastreio,dtentrega) values (4,4,'2023-03-15','SV0004BR',null);
insert into remessa (numpedido,idcliente,dtenvio,codrastreio,dtentrega) values (5,6,'2023-03-28','SV0005BR',null);
insert into remessa (numpedido,idcliente,dtenvio,codrastreio,dtentrega) values (6,1,'2023-04-11','SV0001BR',null);
insert into remessa (numpedido,idcliente,dtenvio,codrastreio,dtentrega) values (8,2,'2023-04-17','SV0002BR',null);
