# WT Private • Select2 (jQuery)

Site privado do WT simulando o comportamento dos componentes da biblioteca
[Select2](https://select2.org/) para validação dos cenários usados pelos
clientes que adotam essa stack.

## Stack

- HTML5
- CSS3
- JavaScript (ES6)
- jQuery 3.6
- Select2 4.1 (single select)
- AdminLTE 3
- Bootstrap 4
- Font Awesome 5

## Páginas

- `/index.html` — **Início**: explica o objetivo do ambiente e orienta a navegação.
- `/index.html?page=clientes` — **Clientes**: página principal de validação com
  sidebar completa, filtros Select2, tabela de clientes e paginação da listagem.
- `/clientes.html` — atalho para redirecionar para a página de clientes.

## Como rodar

Este projeto é estático e é servido localmente com `HttpListener` via PowerShell.

```powershell
powershell -ExecutionPolicy Bypass -File .\serve.ps1
```

Acesse `http://localhost:8090`.

## Estrutura do projeto

- `select2/index.html` — layout principal e toda a lógica de filtros/paginação.
- `select2/clientes.html` — página de redirecionamento para o modo clientes.
- `serve.ps1` — servidor HTTP local para servir os arquivos estáticos.
