# My Best PC 🖥️

Sistema de catálogo web desenvolvido para gestão de componentes de computador, permitindo a criação, leitura, atualização e exclusão (CRUD) de itens, com suporte a upload de imagens e filtragem dinâmica.

## 🚀 Funcionalidades

- **Catálogo Interativo:** Listagem de peças com imagens e descrições.
- **CRUD Completo:** Adicione, edite e remova componentes facilmente.
- **Upload de Imagens:** Suporte para envio de fotos com gestão automática de pastas.
- **Filtro Avançado:** Pesquisa por nome, ordenação por preço/alfabética e filtros técnicos (soquete/DDR).
- **Carrinho de Compras:** Simulação de montagem de PC com cálculo de valor total.
- **Persistência:** Opção para salvar e carregar configurações favoritas via LocalStorage.

## 🛠 Tecnologias Utilizadas

Este projeto foi construído utilizando:

![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![PHP](https://img.shields.io/badge/php-%23777BB4.svg?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

## 📦 Como Instalar e Rodar

Siga estes passos para configurar o ambiente local:

### 1. Pré-requisitos

- Servidor local (XAMPP, WAMP ou Laragon).
- Editor de código (VS Code recomendado).

### 2. Configuração

1. **Clone ou baixe** este repositório para a pasta `htdocs` (se usar XAMPP).
2. **Banco de Dados:**
   - Acesse o `phpMyAdmin` (`http://localhost/phpmyadmin`).
   - Crie um banco de dados chamado `mypc`.
   - Vá em "Importar" e carregue o arquivo `mypc.sql` disponível na raiz deste projeto.
3. **Conexão:**
   - Se o seu utilizador MySQL for diferente de `root` ou tiver senha, edite o arquivo `back/conexao.php`.

### 3. Acesso

1. Inicie o Apache e o MySQL no seu painel de controle.
2. Abra o navegador em: `http://localhost/sua-pasta-do-projeto/index.html`.

## 📁 Estrutura do Projeto

```text
/
├── back/          # Lógica PHP (CRUD, conexões, upload)
├── front/         # Formulários HTML e scripts de UI
├── img/           # Pasta onde ficam armazenadas as imagens
├── mypc.sql       # Script para importação do banco de dados
├── index.html     # Página principal
├── index.js       # Lógica do catálogo e carrinho
└── style.css      # Estilização global
```
