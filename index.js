//ler banco
let dadosOriginais = [];

async function carregarDados() {
  const container = document.querySelector(".produtos-grid");
  console.log("cards antes:", container.children.length);
  container.innerHTML = "";

  let tabela = "Processadores";

  let url = "back/listar.php?tabela=" + tabela;

  console.log("URL completa:", url); // Deve mostrar: back/listar.php?tabela=Processadores

  let resposta = await fetch(url);
  console.log("Status:", resposta.status);

  let dados = await resposta.json();

  if (Array.isArray(dados)) {
    montarCards(dados, tabela);
  } else {
    console.log("Erro:", dados);
  }
}

function montarCards(listaDados, tabela) {
  const container = document.querySelector(".produtos-grid");
  container.innerHTML = "";

  if (!listaDados || listaDados.length === 0) {
    container.innerHTML = "<p>Nenhum produto encontrado.</p>";
    return;
  }
  //-------------------------------------------------------------------------
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

    //btn
    botao.onclick = () => {
      const container = document.querySelector("#carrinho");
      const itens = container.querySelectorAll(".card-produto");
      let jaExiste = false;

      //verifica existencia
      itens.forEach((div) => {
        if (div.querySelector("p").textContent === `1x ${item.nome}`) {
          return (jaExiste = true);
        }
      });

      if (jaExiste) {
        alert(`O item "${item.nome}" já está no carrinho!`);
        return;
      }
      // adiciona na lista
      const card = document.createElement("div");
      card.classList.add("card-produto");

      const titulo = document.createElement("p");
      titulo.textContent = `1x ${item.nome}`;

      const texto = document.createElement("span");
      texto.textContent = `R$ ${parseFloat(item.preco).toFixed(2)}`;

      const imagem = document.createElement("img");
      imagem.src = item.foto ? item.foto : "img/logo.png";
      imagem.alt = item.nome;

      card.append(titulo, texto, imagem);
      container.appendChild(card);
    };
    //-------------------------------------------------------------------------
    //delete
    const btnDeletar = document.createElement("button");
    btnDeletar.classList.add("btn-delet");
    btnDeletar.textContent = "- Deletar";

    btnDeletar.onclick = () => {
      if (confirm(`Deseja realmente deletar o item ${item.nome}?`)) {
        fetch(
          `back/deletar.php?tabela=Processadores&id=${item.id}&foto=${item.foto}`,
        )
          .then((res) => res.text())
          .then((res) => {
            if (res === "ok") {
              carregarDados();
            } else {
              alert("Erro ao deletar: " + res);
            }
          });
      }
    };
    //-------------------------------------------------------------------------
    //edit
    const btnEditar = document.createElement("button");
    btnEditar.classList.add("btn-edit");
    btnEditar.textContent = "Editar";

    btnEditar.onclick = () => {
      window.location.href = `front/cadastrar.html?id=${item.id}&categoria=processador`;
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
