//ler banco
let dadosOriginais = [];

async function carregarDados() {
  var tabela = "Processadores";

  var url = "back/listar.php?tabela=" + tabela;

  console.log("URL completa:", url); // Deve mostrar: back/listar.php?tabela=Processadores

  var resposta = await fetch(url);
  console.log("Status:", resposta.status);

  var dados = await resposta.json();

  if (Array.isArray(dados)) {
    montarCards(dados);
  } else {
    console.log("Erro:", dados);
  }
}

function montarCards(listaDados) {
  const container = document.querySelector(".produtos-grid");
  container.innerHTML = "";

  if (!listaDados || listaDados.length === 0) {
    container.innerHTML = "<p>Nenhum produto encontrado.</p>";
    return;
  }

  listaDados.forEach((item) => {
    const card = document.createElement("div");
    card.classList.add("card-main");

    const titulo = document.createElement("p");
    titulo.textContent = item.nome;

    const texto = document.createElement("span");
    texto.textContent = `R$ ${parseFloat(item.preco).toFixed(2)}`;

    //cart
    const botao = document.createElement("button");
    botao.classList.add("btn-carrinho");
    botao.textContent = "+ Adicionar";

    botao.onclick = () => {
      alert(`${item.nome} adicionado ao carrinho!`);
    };

    //delete
    const btnDeletar = document.createElement("button");
    btnDeletar.classList.add("btn-delet");
    btnDeletar.textContent = "- Deletar";

    btnDeletar.onclick = () => {
      alert(`${item.nome} adicionado ao carrinho!`);
    };

    //edit
    const btnEditar = document.createElement("button");
    btnEditar.classList.add("btn-edit");
    btnEditar.textContent = "Editar";

    btnEditar.onclick = () => {
      alert(`${item.nome} adicionado ao carrinho!`);
    };

    //pegar img
    const imagem = document.createElement("img");
    imagem.src = item.foto ? item.foto : "img/logo.png";
    imagem.alt = item.nome;

    card.append(imagem, titulo, texto, botao, btnDeletar, btnEditar);
    container.appendChild(card);
  });
}

carregarDados();
