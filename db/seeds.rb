# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Administrador.new(nome: "admin", email:"admin@example.com.br", senha: "123123").save!

TipoProduto.create([{ nome: 'Média - 6 fatias' }, { nome: 'Grande - 8 fátia' }, { nome: 'Família - 12 fátia' }])

Produto.create([
    {
        nome: "Presunto e mussarela", 
        descricao: "", 
        quantidade: 10, 
        tipo_produto_id: 1,
        valor: "50,99".to_f,
        imagem: "https://img.cybercook.com.br/receitas/559/pizza-de-presunto-e-mussarela-2-840x480.jpeg?q=75"
    },
    {
        nome: "Calabresa e mussarela", 
        descricao: "", 
        quantidade: 10, 
        tipo_produto_id: 2,
        valor: "80,99".to_f,
        imagem: "https://t2.rg.ltmcdn.com/pt/posts/9/8/3/pizza_calabresa_e_mussarela_4389_600_square.jpg"
    },
    {
        nome: "Calabresa com bacom", 
        descricao: "", 
        quantidade: 10, 
        tipo_produto_id: 3,
        valor: "100,99".to_f,
        imagem: "https://www.clonepizza.com.br/wp-content/uploads/calabresa-com-bacom-4.jpg"
    }
])