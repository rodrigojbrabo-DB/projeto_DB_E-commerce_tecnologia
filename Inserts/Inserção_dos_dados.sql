-- inserção de dados e queries
 -- use ecommerce;
-- show tables;
-- ID_Cliente, Nome, Sobrenome, Email, CPF, CNPJ, Contato, Rua, Complemento, Bairro, Cidade, Estado, CEP
 insert into Cliente (Nome, Sobrenome, Email, CPF, CNPJ, Contato, Rua, Complemento, Bairro, Cidade, Estado, CEP)
		 values	('Lucas', 'Almeida', 'lucas.almeida@example.com', '123.456.789-01', NULL, '(41) 98888-1234', 'Rua das Acácias 120', 'Apto 302', 'Centro', 'Curitiba', 'PR', '80010-000'),
				('Mariana', 'Costa', 'mariana.costa@example.com', '234.567.890-12',  NULL, '(11) 97777-2345', 'Avenida Brasil 450', 'Casa 2', 'Jardim América', 'São Paulo', 'SP', '01430-000'),
                ('Rafael', 'Souza', 'rafael.souza@example.com', '345.678.901-23',  NULL, '(31) 96666-3456', 'Rua Minas Gerais 88', 'Bloco B', 'Funcionários', 'Belo Horizonte', 'MG', '30130-000'),
                ('Fernanda', 'Oliveira', 'fernanda.oliveira@example.com', '456.789.012-34',  NULL, '(51) 95555-4567', 'Rua Bento Gonçalves 775', 'Sala 5', 'Cidade Baixa', 'Porto Alegre', 'RS', '90050-000'),
                ('Gabriel', 'Santos', 'gabriel.santos@example.com', '567.890.123-45',  NULL, '(21) 94444-5678', 'Rua do Catete 230', 'Fundos', 'Catete', 'Rio de Janeiro', 'RJ', '22220-000'),
                ('Carlos','Almeida','carlos.almeida@exemplo.com',NULL,'12.345.678/0001-95','(41) 99999-1001','Rua das Acácias, 125','Sala 01','Centro','Ponta Grossa','PR','84010-000'),
                ('Ricardo','Oliveira','ricardo.oliveira@exemplo.com',NULL,'98.765.432/0001-10','(21) 97777-3003','Rua do Catete, 450','Apto 202','Catete','Rio de Janeiro','RJ','22220-000'),
                ('Camila','Santos','camila.santos@exemplo.com',NULL,'90.123.456/0001-29','(61) 90000-1010','SCLN 210 Bloco D','Loja 12','Asa Norte','Brasília','DF','70862-540');
                
                select * from Cliente;   
 
 -- ID_Fornecedor, RazaoSocial, CNPJ, Contato, Email, Rua, Complemento,	Bairro, Cidade, Estado, CEP
 insert into Fornecedor (RazaoSocial, CNPJ, Contato, Email, Rua, Complemento, Bairro, Cidade, Estado, CEP)
		values ('TechServer Ltda', '12.345.678/0001-90', '(41) 3333-1100', 'comercial@techserver.com.br', 'Rua das Araucárias 250', 'Sala 501', 'Centro', 'Curitiba', 'PR', '80020-120'),
			   ('MegaPC Ltda', '23.456.789/0001-81', '(11) 4444-2200', 'vendas@megapc.com.br', 'Avenida Paulista 1500', 'Andar 12', 'Bela Vista', 'São Paulo', 'SP', '01310-200'),
			   ('DataCore Infras S.A.', '34.567.890/0001-72', '(31) 3555-3300', 'contato@datacore.com.br', 'Rua dos Timbiras 800', 'Galpão A', 'Funcionários', 'Belo Horizonte', 'MG', '30140-070'),
			   ('Prime Servers Ltda', '45.678.901/0001-63', '(51) 3666-4400', 'vendas@primeservers.com.br', 'Avenida Farrapos 1200', 'Bloco B', 'São Geraldo', 'Porto Alegre', 'RS', '90220-000'),
			   ('NetWork HWare Ltda', '56.789.012/0001-54', '(21) 3777-5500', 'comercial@networkhware.com.br', 'Avenida Rio Branco 700', 'Andar 15', 'Centro', 'Rio de Janeiro', 'RJ', '20040-007');
select * from fornecedor;

  -- ID_Vendedor, Nome, Apelido, CNPJ, CPF, Telefone, Email Endereco   
insert into Vendedor (Nome, Apelido, CNPJ, CPF, Telefone, Email, Endereco)
			values ('João Carlos Almeida', 'joao.almeida', NULL, '12345678901', '(41)99123-4567', 'joao.almeida@email.com', 'Rua das Acácias, 125, Jardim Primavera, Curitiba, PR, 80010-120'),
                   ('Mariana Souza Lima', 'mariana.souza', NULL, '23456789012', '(41)99234-5678', 'mariana.souza@email.com', 'Avenida Central, 874, Vila Nova, Campinas, SP, 13050-320'),
				   ('Inova Tech Sistemas LTDA', 'inovatech', '12345678000190', NULL, '(41)99345-6789', 'contato@inovatech.com.br', 'Rua dos Ipês, 42, Parque das Flores, Belo Horizonte, MG, 30110-450'),
				   ('Cloudware Solucoes LTDA', 'cloudware', '23456789000112', NULL, '(41)99456-7890', 'vendas@cloudware.com.br', 'Travessa do Sol, 311, Centro, Florianópolis, SC, 88015-210'),
                   ('Prime Servers Ltda', 'PrimeS', '45.678.901/0001-63', null,'(51) 3666-4400', 'vendas@primeservers.com.br', 'Rua Monte Alegre, 1590, Boa Vista, Recife, PE, 50070-180'),
				   ('Ricardo Fernandes', 'ricardo.fer', NULL, '34567890123', '(41)99567-8901', 'ricardo.fernandes@email.com', 'Rua das Palmeiras, 567, Jardim América, Goiânia,GO, 74250-180');
select * from Vendedor;

 -- ID_Produto, Categoria, Fabricante, Modelo, Cor, Descricao, Valor, Disponibilidade
insert into Produto (Categoria, Fabricante, Modelo, Cor, Descricao, Valor, Disponibilidade)
						-- Notebooks
				values('Notebooks', 'Dell', 'Latitude5420', 'Prata', 'Notebook corporativo com Intel Core i5, 16GB RAM e SSD de 512GB.', 4599.90, 'Disponível'),
					  ('Notebooks', 'Lenovo', 'ThinkBk14G4', 'Cinza', 'Notebook para produtividade com tela Full HD, 8GB RAM e SSD de 256GB.', 3899.90, 'Disponível'),
						-- Desktops
					  ('Desktop', 'Lenovo', 'ThinkCenM70', 'Preto', 'Desktop empresarial com Intel Core i7, 16GB RAM e SSD de 1TB.', 5299.90, 'Disponível'),
                      ('Desktop', 'Dell', 'OptiPlex700', 'Preto', 'Desktop compacto para escritórios e uso corporativo.', 4799.90, 'Indisponível'),
                       -- Servidores
					  ('Servidores', 'HPE', 'ProLiantDL3', 'Cinza', 'Servidor rack para virtualização e aplicações corporativas.', 18999.90, 'Disponível'),
                      ('Servidores', 'Dell', 'PowerEdgeR6', 'Preto', 'Servidor de alto desempenho para bancos de dados e sistemas críticos.', 22499.90, 'Disponível'),
                       -- Thinclients
					  ('Thinclients', 'HP', 't640', 'Preto', 'Thin client compacto para ambientes virtualizados.', 2499.90, 'Disponível'),
					  ('Thinclients', 'Dell', 'Wyse5070', 'Cinza', 'Thin client econômico para acesso remoto e aplicações em nuvem.', 2199.90, 'Disponível'),
                       -- Tablets
                      ('Tablets', 'Samsung', 'GalaxyTabA9', 'Cinza', 'Tablet Android com tela de 10 polegadas para trabalho e entretenimento.', 1399.90, 'Disponível'),
					  ('Tablets', 'Lenovo', 'TabM10Plus', 'Prata', 'Tablet multimídia com tela IPS e bateria de longa duração.', 1599.90, 'Indisponível'), 
                       -- Monitores
                      ('Monitores', 'AOC', '24B2XHM', 'Preto', 'Monitor Full HD de 24 polegadas com conexão HDMI.', 799.90, 'Disponível'),
					  ('Monitores', 'LG', '24MP400', 'Preto', 'Monitor IPS Full HD de 24 polegadas com excelente reprodução de cores.', 899.90, 'Disponível');
select * from Produto;                      

-- ID_Pedido, Status_Pedidos, Descricao_Pedido, Quantidade, Frete, Rastreamento, Valor_Pedido
insert into Pedido (Status_Pedidos, Descricao_Pedido, Quantidade, Frete, Rastreamento, Valor_Unitario)
				values('Pendente',     'Monitor',    1, 12.50, 'AA123459BR',  799.90),
					  ('Confirmado',   'Desktop',    2, 45.00, 'BB987621BR', 5299.90),
					  ('Processando',  'Notebook',   1, 29.90, 'CC456723BR', 3899.90),
					  ('Finalizado',   'Servidor',   1, 95.50, 'DD789156BR', 18999.90),
					  ('Cancelado',    'Tablet',     0, 0, null, 0),
					  ('Confirmado',   'Thinclient', 10, 35.00, 'EE321987BR',  2499.90),
					  ('Processando',  'Monitor',    5, 22.00, 'FF654921BR', 899.90),
					  ('Finalizado',   'Desktop',    1, 40.00, 'GG147269BR', 4799.90),
					  ('Pendente',     'Notebook',   4, 20.00, 'BR274963ZX', 4599.90),
					  ('Cancelado',    'Tablet',     0, 0, null,  0);
select * from Pedido;

-- ID_Pagamento, TipoPagamento, Parcelado, DataPagamento
insert into Pagamento(TipoPagamento, Parcelado, DataPagamento)
				values ('PIX', 'Não', '2025-01-15'),
					   ('Cartão', 'Sim', '2025-02-03'),
					   ('Boleto', 'Não', '2025-02-18'),
					   ('Link', 'Não', '2025-03-07'),
					   ('Cartão', 'Sim', '2025-03-21'),
					   ('PIX', 'Não', '2025-04-11'),
					   ('Boleto', 'Não', '2025-04-29'),
					   ('Cartão', 'Não', '2025-05-14'),
                       (null, null, null),
                       (null, null, null);
                       
select * from Pagamento;

-- ID_Estoque, Localizacao, Quantidade
insert into Estoque(Localizacao, Quantidade)
				Values ('Av. Paulista, 1578 - Bela Vista, São Paulo - SP', 250),
					   ('SGAN 915, Asa Norte, Brasília - DF', 180),
					   ('Av. Atlântica, 1702 - Copacabana, Rio de Janeiro - RJ', 320),
					   ('Av. Sete de Setembro, 2450 - Batel, Curitiba - PR', 145),
					   ('Av. Dom Luís, 500 - Meireles, Fortaleza - CE', 210);
select * from Estoque;

-- ID_ELProduto, ID_ELEstoque, Localizacao
insert into EstoqueLocal (ID_ELProduto, ID_ELEstoque, ELLocalizacao)
				Values(1, 1, 'SP'),
					  (2, 2, 'DF'),
					  (3, 3, 'RJ'),
					  (4, 4, 'PR'),
					  (5, 5, 'CE'),
					  (6, 1, 'SP'),
					  (7, 2, 'DF'),
					  (8, 3, 'RJ'),
					  (9, 4, 'PR'),
					  (10, 5, 'CE'),
					  (11, 1, 'SP'),
					  (12, 2, 'DF');
select * From EstoqueLocal;    

-- ID_PVvendedor, ID_PVproduto, Quantidade, PVStatus
insert into ProdutoVendedor (ID_PVvendedor, ID_PVproduto, Quantidade, PVStatus)
				value (1, 1, 12, 'Disponível'),
					  (2, 2, 5, 'Disponível'),
					  (3, 3, 18, 'Indisponível'),
					  (4, 4, 7, 'Disponível'),
					  (5, 5, 3, 'Disponível'),
					  (1, 6, 14, 'Indisponível'),
					  (2, 7, 9, 'Disponível'),
					  (3, 8, 1, 'Disponível'),
					  (4, 9, 16, 'Indisponível'),
					  (5, 10, 11, 'Disponível'),
					  (1, 11, 4, 'Disponível'),
					  (2, 12, 17, 'Indisponível');
select * from ProdutoVendedor;      

-- ID_PeProProduto, ID_PeProPedido
insert into PedidoProduto (ID_PeProProduto, ID_PeProPedido)                
                value (7, 3),
					  (2, 8),
					  (11, 1),
					  (5, 6),
					  (9, 4),
					  (1, 10),
					  (12, 2),
					  (4, 7),
					  (8, 5),
					  (3, 9),
					  (10, 1),
					  (6, 8);
 select * from PedidoProduto;   
 
 -- ID_PF_Fornecedor, ID_PF_Produto, PFQuantidade, PFStatus
 insert into ProdutoFornecedor (ID_PF_Fornecedor, ID_PF_Produto, PFQuantidade, PFStatus)
				value (3, 1, 42, 'Disponível'),
                      (1, 2, 15, 'Indisponível'),
					  (5, 3, 8, 'Disponível'),
					  (2, 4, 37, 'Disponível'),
					  (4, 5, 23, 'Indisponível'),
					  (1, 6, 50, 'Disponível'),
					  (3, 7, 12, 'Disponível'),
					  (5, 8, 29, 'Indisponível'),
					  (2, 9, 44, 'Disponível'),
					  (4, 10, 6, 'Indisponível'),
					  (1, 11, 31, 'Disponível'),
					  (5, 12, 18, 'Disponível');
 select * from ProdutoFornecedor; 
 
 -- ID_PCPagamento, ID_PCCliente
 insert into Pagamento_Cliente(ID_PCPagamento, ID_PCCliente)
				value (1, 7),
					  (2, 3),
					  (3, 5),
					  (4, 1),
					  (5, 8),
					  (6, 5),
					  (7, 2),
					  (8, 3),
					  (9, 4),
					  (10, 6);
select * from Pagamento_Cliente;     

-- ID_PPPagamento, ID_PPPedido,             
insert into Pedido_Pagamento (ID_PPPagamento, ID_PPPedido)
				value (1, 4),
					  (2, 9),
					  (3, 1),
					  (4, 7),
					  (5, 10),
					  (6, 2),
					  (7, 5),
					  (8, 8),
					  (9, 3),
					  (10, 6);
select * from Pedido_Pagamento;                      
 