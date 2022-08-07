use zelactea;
insert into feedback (id_venda, nota_produto, nota_vendedor) values (1, 10, 10),
(2, 8, 8),
(3, 7, 7),
(4, 3, 3),
(5, 1, 1),
(6, 5, 5),
(7, 7, 7),
(8, 10, 10),
(9, 9, 9),
(10, 8, 8),
(11, 4, 4),
(12, 3, 3),
(13, 2, 2),
(14, 1, 1),
(15, 10, 10),
(16, 7, 7),
(17, 4, 4),
(18, 6, 6),
(19, 8, 8),
(20, 9, 9),
(21, 10, 10),
(22, 9, 9),
(23, 8, 8),
(24, 6, 6);

delete from vendedor where id_vendedor not in (select id_vendedor from venda);
delete from produto where id_produto not in (select id_produto from
nota_fiscal);

update cliente set nome_cliente = 'André Santos' where id_cliente = 1;

select * from cliente;

select count(id_nf) as qtd from nota_fiscal;

select sum(qtd) as Total_de_Produtos_Vendidos from nota_fiscal;

select min(data) as Primeira_Venda from venda;
select max(data) as Última_Venda from venda;

delete from nota_fiscal where id_nf = 21;
delete from venda where id_venda = 21;


select v.data, c.nome_cliente, ve.nome_vendedor, p.nome_produto, p.valor, n.qtd
from venda v inner join cliente c on v.id_cliente = c.id_cliente 
inner join vendedor ve on v.id_vendedor = ve.id_vendedor 
inner join feedback f on f.id_venda = v.id_venda 
inner join nota_fiscal n on n.id_venda = v.id_venda 
inner join produto p on n.id_produto = p.id_produto 
inner join inf_nutri i on p.id_inf_nutri = i.id_inf_nutri 
where data between '2022-03-11' and '2022-07-01';

select * from venda where data between '2022-03-11' and '2022-06-01';


select * from venda;

select * from dias_de_servico;
select * from feedback_avaliacao;
select * from status_produto where Produto like '%Leite%';
select * from media_precos;
select * from top_3;
select * from top_10ve;
select * from top_5c;


call buscar_p(13);
call caro_e_barato;
call cliente_mascfem;
call comissao_por_mes(6,6);
call compras_cliente(13);
call contar_mascfem;
call euro_e_dolar;
call mostrar_cliente(13);
call mostrar_produto(13);
call mostrar_vendedor(13);
call ordem_avaliacao;
call qtd_cliente;
call qtd_estoque;
call qtd_vendedor;
call sexo;
call sexo_cliente;
call soma_estoque;
call venda_por_data('2022-03-01','2022-03-31');
call vendas_vendedor(13);
call validade();

select buscar_clientes(13) as Cliente;
select buscar_produtos(13) as Produto;
select buscar_produtos2(13) as 'Preço do Produto';
select buscar_vendedores(13) as Vendedor;
set @mes = 4;
select saldo_mes(@mes,@lucro) as 'Saldo por Mês';
select lucro_total(@Dede) as 'Lucro Total';


 
select distinct * from inf_nutri i 
inner join produto p on i.id_inf_nutri = p.id_inf_nutri 
inner join nota_fiscal n on p.id_produto = n.id_produto
inner join venda v on n.id_venda = v.id_venda
inner join cliente c on v.id_cliente = c.id_cliente
inner join vendedor ve on v.id_vendedor = ve.id_vendedor
inner join feedback f on v.id_venda = f.id_venda;

select nome_cliente as Nome, email as Email, celular as Celular, endereco as Endereço
from cliente where nome_cliente like 'R%';
select nome_cliente as Nome, email as Email, celular as Celular, endereco as Endereço
from cliente where nome_cliente like 'S%';
select nome_cliente as Nome, email as Email, celular as Celular, endereco as Endereço
from cliente where celular like '(31)%';
select nome_cliente as Nome, email as Email, celular as Celular, endereco as Endereço
from cliente where endereco like '%Belo Horizonte%';
select id_cliente, nome_cliente as Nome, email as Email, celular as Celular, endereco as Endereço
from cliente where endereco not like '%Belo Horizonte%';

update cliente set nome_cliente = 'Nurainla Gomes Félix' where id_cliente = 1;

select c.nome_cliente as Cliente, c.sexo as 'Sexo Cliente', ve.nome_vendedor as Vendedor, ve.sexo as 'Sexo Vendedor', f.nota_vendedor as 'Nota Vendedor', f.nota_produto as 'Nota Produto'
from cliente c inner join venda v on v.id_cliente = c.id_cliente
inner join vendedor ve on ve.id_vendedor = v.id_vendedor
inner join feedback f on f.id_venda = v.id_venda; 

select nome_produto as Produto, validade as Validade, marca as Marca,
	case 
		when datediff(validade, now()) <= 7 then 'Vender com urgência'
        when datediff(validade, now()) <= 15 then 'Ficar atento ao prazo'
        else 'Mais de uma quinzena até o vecimento'
	end as 'Tempo até vencer'
 from produto order by id_produto;
