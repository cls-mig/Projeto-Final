use projetosebovitoria;
set autocommit = 0;

-- Criação das tabelas:
create table cliente (
    id int not null auto_increment,
    nome varchar(255) not null,
    dtnascimento date not null,
    cpf char(11) not null,
    celular char(11),
    logradouro varchar(255) not null,
    numero int not null,
    cep char(8) not null,
    bairro varchar(255) not null,
    email varchar(255) not null,
    senha varchar(255) not null,
    status varchar(55) not null,
    validador int not null,
    constraint pk_cliente primary key (id)
);
create table comentario (
    id int not null auto_increment,
    idcliente int not null,
    mensagem longtext not null,
    data timestamp,
    constraint pk_comentario primary key (id, idcliente)
);
create table exemplar (
    id int not null auto_increment,
    idlivro int not null,
    idfuncionario int not null,
    isbn varchar(15),
    estadoconservacao varchar(55),
    paginas int not null,
    edicao int not null,
    idioma varchar(55) not null,
    preco decimal(6, 2) not null,
    status boolean not null,
    constraint pk_exemplar primary key (id, idlivro)
);
create table funcionario (
    id int not null auto_increment,
    nome varchar(255) not null,
    email varchar(255) not null,
    senha varchar(255) not null,
    acesso varchar(55) not null,
    constraint pk_funcionario primary key (id)
);
create table itempedido (
    numpedido int not null,
    idcliente int not null,
    idlivro int not null,
    idexemplar int not null,
    constraint primary key (numpedido, idcliente, idlivro, idexemplar)
);
create table livro (
    id int not null auto_increment,
    titulo varchar(255) not null,
    autor varchar(255) not null,
    editora varchar(255) not null,
    volume varchar(255),
    genero varchar(155) not null,
    quantidade int,
    constraint pk_livro primary key (id)
);
create table pedido (
    numero int not null auto_increment,
    idcliente int not null,
    dtpedido timestamp not null,
    quantidade int not null,
    valor decimal(6, 2) not null,
    constraint pk_pedido primary key (numero, idcliente)
);
create table remessa (
    numpedido int not null,
    idcliente int not null,
    dtenvio timestamp not null,
    codrastreio char(11) not null,
    dtentrega timestamp,
    constraint pk_remessa primary key (idcliente, numpedido)
);

-- Criação das Unique Key:
alter table cliente
    add constraint uk_cliente_cpf
    unique (cpf);
alter table cliente
    add constraint uk_cliente_email
    unique (email);
alter table funcionario
    add constraint uk_funcionario_email
    unique (email);

-- Criação das Foreign Key:
alter table exemplar
    add constraint fk_exemplar_idlivro
    foreign key (idlivro)
    references livro (id);
alter table comentario
    add constraint fk_comentario_idcliente
    foreign key (idcliente)
    references cliente (id);
alter table itempedido
    add constraint fk_itempedido_numpedido_idcliente
    foreign key (numpedido, idcliente)
    references pedido (numero, idcliente);
alter table pedido
    add constraint fk_pedido_idcliente
    foreign key (idcliente)
    references cliente (id);
alter table exemplar
    add constraint fk_exemplar_idfuncionario
    foreign key (idfuncionario)
    references funcionario (id);
alter table itempedido
    add constraint fk_itempedido_idexemplar_idlivro
    foreign key (idlivro, idexemplar)
    references exemplar (idlivro, id);
alter table remessa
    add constraint fk_remessa_numpedido_idcliente
    foreign key (numpedido, idcliente)
    references pedido (numero, idcliente);

-- Criação das Triggers:
-- 1) Atualizar a quantidade de livros após um exemplar ser inserido:
create trigger tgr_exemplar_insert
    after insert on exemplar
    for each row update livro
    set quantidade = (
	select count(new.idlivro)
	from exemplar
        where exemplar.idlivro = livro.id
	    and exemplar.status=1
    );
-- 2) Atualizar o status do exemplar para vendido após um item de pedido ser inserido:
create trigger tgr_itempedido_insert
    after insert on itempedido
    for each row update exemplar
    set status=0 where id in (
	select new.idexemplar
        from itempedido
    );
-- 3) Atualizar a quantidade de livros após um exemplar ser vendido:
create trigger tgr_exemplar_update
    after update on exemplar
    for each row update livro
    set quantidade = (
	select count(new.idlivro)
        from exemplar
        where exemplar.idlivro = livro.id
	    and exemplar.status=1
    );
-- 4) Atualizar a quantidade de livros após um exemplar ser excluído:
create trigger tgr_exemplar_delete
    after delete on exemplar
    for each row update livro
    set quantidade = (
	select count(idlivro)
        from exemplar
        where exemplar.idlivro = livro.id
	    and exemplar.status=1
    );
