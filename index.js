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
let filtroSoquete = "";
let filtroDDR = "";

async function carregarDados() {
  const container = document.querySelector(".produtos-grid");
  console.log("cards antes:", container.children.length);
  container.innerHTML = "";

  const selectFiltro = document.querySelector(".selectFiltro");
  const opcaoSelecionada = selectFiltro.value;

  const inputBusca = document.querySelector("#inputBusca");
  const termoBusca = inputBusca ? encodeURIComponent(inputBusca.value) : "";

  let url = "";
  if (
    opcaoSelecionada === "menor" ||
    opcaoSelecionada === "maior" ||
    opcaoSelecionada === "alfabeto"
  ) {
    url = `back/listar.php?tabela=${tabela[paginaAtual]}&ordem=${opcaoSelecionada}&busca=${termoBusca}`;
  } else {
    url = `back/listar.php?tabela=${tabela[paginaAtual]}&ordem=relevancia&busca=${termoBusca}`;
  }

  if (filtroSoquete) url += `&soquete=${encodeURIComponent(filtroSoquete)}`;
  if (filtroDDR) url += `&ddr=${encodeURIComponent(filtroDDR)}`;
  let resposta = await fetch(url);

  let dados = await resposta.json();

  if (Array.isArray(dados)) {
    montarCards(dados, tabela[paginaAtual]);
    atualizarBotoesPagina();
  } else {
    console.log("Erro:", dados);
  }

  const btnLupa = document.getElementById("lupa");
  if (btnLupa) {
    btnLupa.addEventListener("click", () => {
      carregarDados();
    });
  }

  const inputBuscaElemento = document.getElementById("inputBusca");
  if (inputBuscaElemento) {
    inputBuscaElemento.addEventListener("keypress", (e) => {
      if (e.key === "Enter") {
        carregarDados();
      }
    });
  }
  const selectFiltroElemento = document.querySelector(".selectFiltro");
  if (selectFiltroElemento) {
    selectFiltroElemento.addEventListener("change", () => {
      carregarDados();
    });
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

    const img = document.createElement("img");
    img.setAttribute("src", "img/cart.png");
    img.style.width = "20px";
    img.style.height = "13px";

    botao.append(img);

    //btn
    botao.onclick = () => {
      const container = document.querySelector("#carrinho");
      const itens = container.querySelectorAll(".card-produto");
      let categoriaJaExiste = false;

      itens.forEach((div) => {
        if (div.dataset.categoria === tabela) {
          categoriaJaExiste = true;
        }
      });

      if (categoriaJaExiste) {
        alert(
          `Você já adicionou um item da categoria "${tabela}" ao carrinho! Remova o atual antes de adicionar outro.`,
        );
        return;
      }

      const card = document.createElement("div");
      card.classList.add("card-produto");

      card.dataset.categoria = tabela;
      card.dataset.id = item.id;

      if (item.soquete) card.dataset.soquete = item.soquete;
      if (item.ddr) card.dataset.ddr = item.ddr;

      const cart_delete = document.createElement("button");
      cart_delete.addEventListener("click", () => {
        card.remove();
        atualizarFiltrosCarrinho();
        total();
        carregarDados();
      });
      const imgCart_D = document.createElement("img");
      imgCart_D.setAttribute("src", "img/lixo.png");
      imgCart_D.style.width = "20px";
      imgCart_D.style.height = "20px";
      imgCart_D.style.cursor = "pointer";

      cart_delete.append(imgCart_D);
      cart_delete.style.background = "none";

      cart_delete.addEventListener("click", () => {
        card.remove();
        total();
      });

      const nomeItem = document.createElement("p");
      nomeItem.textContent = `1x ${item.nome}`;

      const texto = document.createElement("span");
      texto.textContent = `R$ ${parseFloat(item.preco).toFixed(2)}`;

      const imagem = document.createElement("img");
      imagem.src = item.foto ? item.foto : "img/logo.png";
      imagem.alt = item.nome;

      card.append(cart_delete, nomeItem, texto, imagem);
      container.appendChild(card);

      atualizarFiltrosCarrinho();
      total();
      carregarDados();
    };
    //-------------------------------------------------------------------------
    //delete
    const btnDeletar = document.createElement("button");
    btnDeletar.classList.add("btn-delet");

    const imgD = document.createElement("img");
    imgD.setAttribute("src", "img/delete.png");
    imgD.style.width = "20px";
    imgD.style.height = "15px";

    btnDeletar.append(imgD);

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

    const imgE = document.createElement("img");
    imgE.setAttribute("src", "img/edit.png");
    imgE.style.width = "20px";
    imgE.style.height = "14px";

    btnEditar.append(imgE);

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

btnSalvar.addEventListener("click", async () => {
  try {
    const containerCarrinho = document.querySelector("#carrinho");
    const itensCarrinho = containerCarrinho.querySelectorAll(".card-produto");
    const configSalva = localStorage.getItem("mypc_saved_ids");

    if (itensCarrinho.length > 0) {
      let configIds = [];

      itensCarrinho.forEach((card) => {
        configIds.push({
          id: card.dataset.id,
          categoria: card.dataset.categoria,
        });
      });

      localStorage.setItem("mypc_saved_ids", JSON.stringify(configIds));

      if (configIds.length >= 7) {
        alert("Sua configuração COMPLETA foi salva com sucesso!");
      } else {
        alert(
          "Configuração salva com sucesso! (Faltam peças para um PC completo).",
        );
      }
    } else if (itensCarrinho.length === 0 && configSalva) {
      const configuracao = JSON.parse(configSalva);

      if (!Array.isArray(configuracao) || configuracao.length === 0) {
        alert("A configuração salva está vazia ou corrompida.");
        return;
      }

      containerCarrinho.innerHTML = "";

      for (const itemSalvo of configuracao) {
        const resposta = await fetch(
          `back/listar.php?tabela=${itemSalvo.categoria}&id=${itemSalvo.id}`,
        );
        const dados = await resposta.json();

        if (dados && dados.length > 0) {
          const item = dados[0];

          const card = document.createElement("div");
          card.classList.add("card-produto");
          card.dataset.categoria = itemSalvo.categoria;
          card.dataset.id = item.id;

          if (item.soquete) card.dataset.soquete = item.soquete;
          if (item.ddr) card.dataset.ddr = item.ddr;

          const cart_delete = document.createElement("button");
          const imgCart_D = document.createElement("img");
          imgCart_D.setAttribute("src", "img/lixo.png");
          imgCart_D.style.width = "20px";
          imgCart_D.style.height = "20px";
          imgCart_D.style.cursor = "pointer";

          cart_delete.append(imgCart_D);
          cart_delete.style.background = "none";

          cart_delete.addEventListener("click", () => {
            card.remove();
            atualizarFiltrosCarrinho();
            total();
            carregarDados();
          });

          const nomeItem = document.createElement("p");
          nomeItem.textContent = `1x ${item.nome}`;

          const texto = document.createElement("span");
          texto.textContent = `R$ ${parseFloat(item.preco).toFixed(2)}`;

          const imagem = document.createElement("img");
          imagem.src = item.foto ? item.foto : "img/logo.png";
          imagem.alt = item.nome;

          card.append(cart_delete, nomeItem, texto, imagem);
          containerCarrinho.appendChild(card);
        }
      }

      atualizarFiltrosCarrinho();
      total();
      carregarDados();

      alert("Configuração carregada com sucesso e com os preços atualizados!");
    } else {
      alert(
        "O carrinho está vazio e não há nenhuma configuração salva para carregar.",
      );
    }
  } catch (erro) {
    console.error("Erro ao gerenciar a configuração:", erro);
    alert("Ocorreu um erro ao salvar ou carregar.");
  }
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
// carrinho valor ---------------------------------------------------
function total() {
  const containerCarrinho = document.querySelector("#carrinho");
  const itens = containerCarrinho.querySelectorAll(".card-produto");
  let total = 0;

  itens.forEach((div) => {
    const spanPreco = div.querySelector("span");
    if (spanPreco) {
      const precoTexto = spanPreco.textContent.replace("R$", "").trim();
      total += parseFloat(precoTexto);
    }
  });

  const pValor = document.querySelector(".valor p");
  if (pValor) {
    pValor.textContent = `R$ ${total.toFixed(2).replace(".", ",")}`;
  }
}
// compatibilidade dos produtos
function atualizarFiltrosCarrinho() {
  filtroSoquete = "";
  filtroDDR = "";

  const itensCarrinho = document.querySelectorAll("#carrinho .card-produto");

  itensCarrinho.forEach((card) => {
    if (card.dataset.soquete) filtroSoquete = card.dataset.soquete;
    if (card.dataset.ddr) filtroDDR = card.dataset.ddr;
  });
}
