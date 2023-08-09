use projetosebovitoria;
set autocommit = 0;

-- Seleção:
select * from funcionario;
select * from livro;
select * from exemplar;
select * from cliente;
select * from pedido;
select * from itempedido;
select * from remessa;
select * from comentario;

/*
-- 1) Título do livro dos pedidos que não foram enviados:
    select l.titulo
    from livro l, exemplar e, itempedido ip, pedido p
    where l.id = e.idlivro
	and e.id = ip.idexemplar
	and ip.numpedido = p.numero
        and p.numero not in (select numpedido from remessa);
*/        
-- 2) Funcionário lista pedidos pagos mas que não foram remetidos:
    select numero
    from pedido
    where numero not in (select numpedido from remessa);
/*
-- 3) Dar baixa em todos os exemplares vendidos no pedido de número 10 (pedidos específicos):
    update exemplar
    set status=0
    where id in (
	select ip.idexemplar
        from itempedido ip, pedido p
        where p.numero = ip.numpedido
	    and p.numero = 4
    );
*/
-- 4) Dar baixa em todos os exemplares que pertencem a pedidos pagos:
    update exemplar
    set status=0
    where id in (
	select ip.idexemplar
        from itempedido ip, pedido p
        where p.numero = ip.numpedido
    );
/*
-- 5) Consultar os exemplares que possuem status de disponível:
    select e.id, l.titulo, l.autor, l.genero, e.estadoconservacao, e.preco
    from livro l, exemplar e
    where l.id=e.idlivro
	and e.status=1
        and e.id not in (select idexemplar from itempedido)
        order by e.id desc;
*/
