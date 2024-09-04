-- lista 1

use ecommerce_22B;

-- Exercício 1: Listar todos os pedidos com detalhes do cliente Escreva uma consulta SQL que retorne o ID do pedido, a data do pedido, o nome completo do cliente e o email para todos os pedidos. Use um JOIN para combinar as tabelas Orders e Customers.

SELECT o.order_id, o.order_date, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, c.email
FROM Orders o
INNER JOIN Customers c ON o.customer_id = c.customer_id;

-- Exercício 2: Encontrar todos os produtos pedidos por um cliente específico Escreva uma consulta SQL que retorne o nome do produto e a quantidade pedida para todos os produtos pedidos por um cliente com um customer_id específico (por exemplo, customer_id = 1). Essa consulta deve combinar as tabelas Order_Items, Orders e Products.

SELECT p.product_name, oi.quantity
FROM Order_Items oi
INNER JOIN Orders o ON oi.order_id = o.order_id
INNER JOIN Products p ON oi.product_id = p.product_id
WHERE o.customer_id = 1;  -- Substitua 1 pelo customer_id desejado


-- Exercício 3: Calcular o total gasto por cada cliente Escreva uma consulta SQL que calcule o total gasto por cada cliente. O resultado deve incluir o nome completo do cliente e o total gasto. Essa consulta deve usar JOINs para combinar as tabelas Customers, Orders, Order_Items e Products, e deve usar uma função de agregação para calcular o total.

SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(oi.quantity * p.price) AS total_spent
FROM Customers c
INNER JOIN Orders o ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi ON o.order_id = oi.order_id
INNER JOIN Products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.first_name, c.last_name;


-- Exercício 4: Encontrar os clientes que nunca fizeram um pedido Escreva uma consulta SQL que retorne os nomes dos clientes que nunca fizeram um pedido. Para isso, use um LEFT JOIN entre as tabelas Customers e Orders e filtre os resultados para encontrar clientes sem pedidos.

SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- Exercício 5: Listar os produtos mais vendidos Escreva uma consulta SQL que retorne o nome do produto e a quantidade total vendida, ordenando os resultados pelos produtos mais vendidos. Combine as tabelas Order_Items e Products, e utilize uma função de agregação para somar a quantidade vendida de cada produto.

SELECT p.product_name, SUM(oi.quantity) AS total_quantity_sold
FROM Order_Items oi
INNER JOIN Products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;


-----------------------------------------------------------------------------------------------------------------------------

-- lista 2 

-- E-commerce e Gestão de Inventário

-- Exercício 1: Escreva uma consulta SQL que recupere todos os pedidos juntamente com o nome e o email dos clientes que fizeram esses pedidos. Utilize INNER JOIN para combinar as tabelas de pedidos e clientes.

SELECT p.pedido_id, c.nome, c.email
FROM pedidos p
INNER JOIN clientes c ON p.cliente_id = c.cliente_id;


-- Sistema de Gestão de Relacionamento com o Cliente (CRM)

-- Exercício 2: Desenvolva uma consulta que liste todas as campanhas e os clientes que participaram delas. Utilize INNER JOIN para combinar as tabelas de campanhas e participações de campanha.

SELECT camp.campanha_id, camp.nome AS campanha_nome, c.nome AS cliente_nome
FROM campanhas camp
INNER JOIN participacoes_campanha pc ON camp.campanha_id = pc.campanha_id
INNER JOIN clientes c ON pc.cliente_id = c.cliente_id;

-- Finanças e Controle Orçamentário

-- Exercício 3: Crie uma consulta para listar todas as transações com a categoria do orçamento associada, se houver. Utilize LEFT JOIN para incluir todas as transações.

SELECT t.transacao_id, t.tipo AS tipo_transacao, t.valor, t.descricao, o.categoria
FROM transacoes t
LEFT JOIN orcamentos o ON t.orcamento_id = o.orcamento_id;

--  Saúde e Gestão de Prontuários Eletrônicos

-- Exercício 4: Crie uma consulta para exibir todos os pacientes e os prontuários relacionados, incluindo pacientes sem prontuários. Utilize LEFT JOIN entre as tabelas de pacientes e prontuários.

SELECT p.nome AS paciente_nome, pr.prontuario_id, pr.data_consulta, pr.medico, pr.diagnostico, pr.prescricao, pr.observacoes
FROM pacientes p
LEFT JOIN prontuarios pr ON p.paciente_id = pr.paciente_id;

--  Logística e Cadeia de Suprimentos

-- Exercício 5: Crie uma consulta para exibir todos os fornecedores e os produtos fornecidos por eles, incluindo fornecedores que não forneceram produtos. Utilize LEFT JOIN entre as tabelas de fornecedores e produtos.

SELECT f.nome AS fornecedor_nome, p.nome AS produto_nome
FROM fornecedores f
LEFT JOIN produtos p ON f.fornecedor_id = p.fornecedor_id;