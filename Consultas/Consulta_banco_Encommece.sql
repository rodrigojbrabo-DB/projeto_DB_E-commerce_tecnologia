-- Consultas ao Banco de Dados

  use ecommerce;
  show tables;
  -- lista os dados da tabela Cliente
  select * from Cliente;  
  -- Consultas usando select e wehere.
  
  -- listar os cliente que são que são do estado do Rio de Janeiro
  select Nome, Sobrenome, Estado from Cliente where Estado = 'RJ';
  
  -- lista todos os clientes que são pessoa Fisica
  select Nome, Sobrenome, CPF from Cliente where CPF is not null;
  
  -- Mostrar os produtos da categoria "Notebook".
  Select Categoria, Fabricante, Modelo from Produto where Categoria = 'Notebooks';
  
  -- Consultas usando o Order by.
  
  -- Listar os clientes em ordem alfabética pelo nome.
  select * from Cliente order by nome;
  
  -- Mostrar os produtos do mais caro para o mais barato.
  select Categoria, Modelo, Valor 
			From Produto 
  order by Valor desc;
  
  -- Quantos pedidos foram feitos por cada cliente
  select c.Nome, c.Sobrenome,
		count(p.Id_Pedido) as Total_Pedidos
        From Cliente c left join Pedido p on c.ID_Cliente = p.ID_PCliente
        group by c.ID_Cliente, c.Nome, c.Sobrenome;
            
 -- consulta se algum vendedor também é fornecedor
 select V.ID_Vendedor, V.Nome, V.CNPJ, F.ID_Fornecedor, F.RazaoSocial From Vendedor V
		inner join Fornecedor F on V.CNPJ = F.CNPJ;
        
        -- O valor médio dos produtos por categoria
        select Categoria, concat('R$ ', format(Avg(Valor), 2, 'pt_BR')) as Valor_Medio
			from Produto group by Categoria having avg(Valor) > 2000
            order by Valor_Medio desc;
        
  -- Relação de produtos fornecedores e estoques
  select P.ID_Produto, P.Modelo, P.Categoria, F.RazaoSocial as Fornecedor,
		PF.PFQuantidade as Quantidade_Estoque, E.Localizacao, E.Quantidade as Quantidade_Estoque
        From Produto P inner join ProdutoFornecedor PF on P.ID_Produto = PF.ID_PF_Produto
			inner join Fornecedor F on PF.ID_PF_Fornecedor = F.ID_Fornecedor
            inner join EstoqueLocal EL on P.ID_Produto = EL.ID_ELProduto
            inner join Estoque E on EL.ID_ELEstoque = E.ID_estoque;

-- Relação de nomes dos fornecedores e nomes dos produtos
select F.RazaoSocial, P.Modelo, count(P.ID_Produto) as Total_Produtos
		From Fornecedor F inner join ProdutoFornecedor PF on F.ID_Fornecedor = PF.ID_PF_Fornecedor
			inner join Produto P on PF.ID_PF_Produto = P.ID_Produto
            Group by F.RazaoSocial, P.Modelo
            Having count(P.ID_Produto) >= 1;

-- 3 Produtos que vendeu quem é o fornecedor ordenado por valor
select P.Modelo as Produto, F.RazaoSocial as Fornecedor,
	sum(PED.Quantidade) as Total_Vendido, P.Valor 
    From Produto P inner join PedidoProduto PP on P.ID_Produto = PP.ID_PeProProduto
			inner join Pedido PED on PP.ID_PeProProduto = PED.ID_Pedido
            inner join ProdutoFornecedor PF on P.ID_Produto = PF.ID_PF_Produto
            inner join Fornecedor F on PF.ID_PF_Fornecedor = F.ID_Fornecedor
            group by  P.Modelo, F.RazaoSocial, P.Valor
            order by Total_Vendido desc, P.Valor desc limit 3;

-- Consuta quais clientes compraram quais produtos ordenados por Estado

select concat(C.nome, '', C.Sobrenome) as Cliente,
C.Estado, P.Categoria, P.modelo as Produto, PE.Quantidade,
	Concat('R$ ', Format(PE.Valor_Pedido, 2, 'pt_BR')) as Valor_Pedido,
    PE.Status_Pedidos
    from Cliente C inner Join Pedido PE on C.ID_Cliente = PE.ID_PCliente
				  inner join PedidoProduto PP on PE.ID_Pedido = PP.ID_PeProPedido
                  inner join Produto P on PP.ID_PeProProduto = P.ID_Produto
                  order by C.Estado asc, PE.Valor_Pedido desc;
