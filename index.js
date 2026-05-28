//ler banco   -----------------------------------------------------------
let dadosOriginais = [];
let paginaAtual = 0;
let tabela = [
  "Processadores",
  "PlacaMae",
  "Ram",
  "Ssd",
  "GPU",
  "Fontes",
  "Gabinetes",
];
async function carregarDados() {
  const container = document.querySelector(".produtos-grid");
  console.log("cards antes:", container.children.length);
  container.innerHTML = "";

  const selectFiltro = document.querySelector(".selectFiltro");
  const opcaoSelecionada = selectFiltro.value;

  let url = "";
  if (
    opcaoSelecionada === "menor" ||
    opcaoSelecionada === "maior" ||
    opcaoSelecionada === "alfabeto"
  ) {
    url = `back/listar.php?tabela=${tabela[paginaAtual]}&ordem=${opcaoSelecionada}`;
  } else {
    url = `back/listar.php?tabela=${tabela[paginaAtual]}&ordem=relevancia`;
  }

  let resposta = await fetch(url);

  let dados = await resposta.json();

  if (Array.isArray(dados)) {
    montarCards(dados, tabela[paginaAtual]);
    atualizarBotoesPagina();
  } else {
    console.log("Erro:", dados);
  }
}
// cards ---------------------------------------------------------------------------------------------------------------
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
          `back/deletar.php?tabela=${tabela}&id=${item.id}&foto=${item.foto}`,
        )
          .then((res) => res.text())
          .then((res) => {
            if (res.trim() === "ok") {
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
      window.location.href = `front/cadastrar.html?id=${item.id}&categoria=${tabela.toLowerCase()}`;
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
// more btn ------------------------------------------------------------------
const btnMore = document.getElementById("more");
btnMore.addEventListener("click", () => {
  alert(`Site feito por um Desenvolvedor Junior seja paciente \n
     Dicas: \n
     O botão (...) serve para ocultar/mostra a barra lateral (carrinho);\n
     O botão (cartucho) serve para salva/carregar sua ultima configuração feita;\n
     O botão (compartilhar) serve para compartinhar o link da configuração já salvo;\n
     O (ADD) serve para Adicionar um novo item ao site;\n
     A caixa de seleção organiza a ordem dos cards de acordo com sua necessidade;\n
     O campo de pesquisa filtra produtos que correspondem;\n
     A lupa server para enviar a filtragem e pesquisa atualizando o site;\n
     A informação monetaria mostra o total gasto até então;\n`);
  alert(`Menu lateral mostra os itens que você adicionou;\n
     O conteudo principal fica organizado logo ao lado;\n
     Os botões abaixo serve para navegar entre categorias anteriores ou próximas;\n
     Qualquer outra duvida consulte https://github.com/EduardoPoc/MyPC.`);
});
// save button -----------------------------------------------------------------
const btnSalvar = document.getElementById("salvar");
btnSalvar.addEventListener("click", () => {
  alert("salvo"); //add real function
});
//setings button ===================================================================
const btnMudar = document.getElementById("settings");
const menulateral = document.getElementById("carrinho");
btnMudar.addEventListener("click", () => {
  menulateral.classList.toggle("ocultar");
});
// mudar pagina
const btnAvancar = document.getElementById("avancar");
const btnVoltar = document.getElementById("voltar");

btnAvancar.addEventListener("click", () => {
  if (paginaAtual < tabela.length - 1) {
    paginaAtual++;
    carregarDados();
  }
});

btnVoltar.addEventListener("click", () => {
  if (paginaAtual > 0) {
    paginaAtual--;
    carregarDados();
  }
});

function atualizarBotoesPagina() {
  if (!btnVoltar || !btnAvancar) return;

  if (paginaAtual === 0) {
    btnVoltar.classList.add("ocultar");
  } else {
    btnVoltar.classList.remove("ocultar");
  }

  if (paginaAtual === tabela.length - 1) {
    btnAvancar.classList.add("ocultar");
  } else {
    btnAvancar.classList.remove("ocultar");
  }
}
