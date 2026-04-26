# API — Blog Anti-Recaí

## Sumário

- [Autenticação](#autenticação)
- [Usuários](#usuários)
- [Posts](#posts)
- [Comentários](#comentários)
- [Resumo das Rotas](#resumo-das-rotas)
- [Requisitos Funcionais](#requisitos-funcionais)
- [Requisitos Não Funcionais](#requisitos-não-funcionais)

---

## Autenticação

### `POST /auth/create-user`

Cria um novo usuário.

**Body:**
```json
{
  "name": "João Silva",
  "email": "joao@email.com",
  "password": "senha123"
}
```

**Retorno `201`:**
```json
{
  "jwt": "eyJhbGciOiJIUzI1NiJ9..."
}
```

---

### `POST /auth/login`

Autentica um usuário existente.

**Body:**
```json
{
  "email": "joao@email.com",
  "password": "senha123"
}
```

**Retorno `200`:**
```json
{
  "jwt": "eyJhbGciOiJIUzI1NiJ9..."
}
```

---

### `GET /auth/me`

> 🔒 Requer JWT

Retorna os dados do usuário autenticado.

**Retorno `200`:**
```json
{
  "id": "user1",
  "name": "João Silva",
  "email": "joao@email.com",
  "bio": "Minha bio aqui",
  "foto_profile": "https://cdn.exemplo.com/foto.jpg",
  "role": "user"
}
```

---

### `PUT /auth/modify-user/{id}`

> 🔒 Requer JWT | `multipart/form-data` | Apenas o próprio usuário ou admin

Atualiza os dados do perfil do usuário.

**Body (`multipart/form-data`):**
```
name         = "João Silva"
bio          = "Nova bio"
foto_profile = <arquivo de imagem>
```

**Retorno `200`:**
```json
{
  "id": "user1",
  "name": "João Silva",
  "bio": "Nova bio",
  "foto_profile": "https://cdn.exemplo.com/foto.jpg",
  "role": "user"
}
```

---

### `DELETE /auth/delete-user/{id}`

> 🔒 Requer JWT | Apenas o próprio usuário ou admin

Remove um usuário do sistema.

**Retorno `200`:**
```json
{
  "message": "Usuário deletado com sucesso"
}
```

---

## Usuários

### `GET /users/{id}`

Retorna o perfil público de um usuário com seus posts paginados.

**Retorno `200`:**
```json
{
  "id": "user1",
  "name": "João Silva",
  "bio": "Minha bio",
  "foto": "https://cdn.exemplo.com/foto.jpg",
  "role": "user",
  "likes": 120,
  "comments": 34,
  "posts": {
    "entries": [
      {
        "id": "post1",
        "name": "Título do Post",
        "des": "Descrição curta",
        "foto": "https://cdn.exemplo.com/post.jpg",
        "horario": "2026-04-26T14:30:00Z",
        "type": "artigo"
      }
    ],
    "page": 1,
    "page_size": 10,
    "total_entries": 42,
    "total_pages": 5
  }
}
```

---

## Posts

### `GET /posts?page=1&type=artigo&search=recaida`

Lista todos os posts com suporte a paginação, filtro por tópico e busca por título.

**Query params:**

| Param    | Tipo    | Obrigatório | Descrição                        |
|----------|---------|-------------|----------------------------------|
| `page`   | integer | Não         | Página atual (default: 1)        |
| `type`   | string  | Não         | Filtro por tópico/tipo           |
| `search` | string  | Não         | Busca por título                 |

**Retorno `200`:**
```json
{
  "entries": [
    {
      "id": "post1",
      "name": "Título do Post",
      "des": "Descrição curta",
      "foto": "https://cdn.exemplo.com/post.jpg",
      "horario": "2026-04-26T14:30:00Z",
      "type": "artigo",
      "author": {
        "id": "user1",
        "name": "João Silva",
        "foto": "https://cdn.exemplo.com/joao.jpg"
      }
    }
  ],
  "page": 1,
  "page_size": 10,
  "total_entries": 42,
  "total_pages": 5
}
```

---

### `GET /posts/{id}`

Retorna um post completo com conteúdo em markdown e comentários paginados.

**Retorno `200`:**
```json
{
  "id": "abc123",
  "name": "Título do Post",
  "des": "Descrição curta",
  "foto": "https://cdn.exemplo.com/post.jpg",
  "horario": "2026-04-26T14:30:00Z",
  "type": "artigo",
  "decri": "# Markdown aqui\n\nConteúdo completo do post...",
  "author": {
    "id": "user1",
    "name": "João Silva",
    "foto": "https://cdn.exemplo.com/joao.jpg"
  },
  "likes": 98,
  "dislikes": 3,
  "comments": {
    "entries": [
      {
        "id": "c1",
        "parent_id": null,
        "depth": 0,
        "descri": "Comentário raiz",
        "user": { "name": "Maria", "foto": "https://cdn.exemplo.com/maria.jpg" },
        "likes": 10,
        "dislikes": 1,
        "reply_count": 3,
        "horario": "2026-04-26T15:00:00Z"
      },
      {
        "id": "c2",
        "parent_id": "c1",
        "depth": 1,
        "descri": "Resposta ao c1",
        "user": { "name": "Pedro", "foto": "https://cdn.exemplo.com/pedro.jpg" },
        "likes": 4,
        "dislikes": 0,
        "reply_count": 1,
        "horario": "2026-04-26T15:10:00Z"
      }
    ],
    "page": 1,
    "page_size": 20,
    "total_entries": 80,
    "total_pages": 4
  }
}
```

---

### `POST /posts`

> 🔒 Requer JWT | Apenas `role: admin`

Cria um novo post.

**Body:**
```json
{
  "name": "Título do Post",
  "des": "Descrição curta",
  "decri": "# Markdown\n\nConteúdo completo...",
  "foto": "https://cdn.exemplo.com/post.jpg",
  "type": "artigo"
}
```

**Retorno `201`:**
```json
{
  "id": "abc123",
  "name": "Título do Post",
  "des": "Descrição curta",
  "decri": "# Markdown\n\nConteúdo completo...",
  "foto": "https://cdn.exemplo.com/post.jpg",
  "horario": "2026-04-26T14:30:00Z",
  "type": "artigo",
  "author": {
    "id": "user1",
    "name": "João Silva",
    "foto": "https://cdn.exemplo.com/joao.jpg"
  }
}
```

---

## Comentários

### `POST /posts/{post_id}/comments`

> 🔒 Requer JWT

Cria um comentário ou resposta em um post. Para responder a outro comentário, informe o `parent_id`.

**Body:**
```json
{
  "descri": "Meu comentário aqui",
  "parent_id": null
}
```

> `parent_id` é `null` para comentário raiz, ou o `id` do comentário pai para resposta.

**Retorno `201`:**
```json
{
  "id": "c10",
  "parent_id": null,
  "depth": 0,
  "descri": "Meu comentário aqui",
  "user": { "name": "João Silva", "foto": "https://cdn.exemplo.com/joao.jpg" },
  "likes": 0,
  "dislikes": 0,
  "reply_count": 0,
  "horario": "2026-04-26T16:00:00Z"
}
```

---

### `GET /posts/{post_id}/comments/{comment_id}/replies?page=1`

Retorna as respostas paginadas de um comentário específico.

**Retorno `200`:**
```json
{
  "entries": [
    {
      "id": "c4",
      "parent_id": "c1",
      "depth": 1,
      "descri": "Resposta ao comentário",
      "user": { "name": "Lucas", "foto": "https://cdn.exemplo.com/lucas.jpg" },
      "likes": 2,
      "dislikes": 0,
      "reply_count": 0,
      "horario": "2026-04-26T16:00:00Z"
    }
  ],
  "page": 1,
  "page_size": 10,
  "total_entries": 3,
  "total_pages": 1
}
```

---

### `POST /posts/{post_id}/comments/{comment_id}/like`

> 🔒 Requer JWT

Registra um like em um comentário.

**Retorno `200`:**
```json
{
  "comment_id": "c1",
  "likes": 11,
  "dislikes": 1
}
```

---

### `POST /posts/{post_id}/comments/{comment_id}/dislike`

> 🔒 Requer JWT

Registra um dislike em um comentário.

**Retorno `200`:**
```json
{
  "comment_id": "c1",
  "likes": 10,
  "dislikes": 2
}
```

---

## Resumo das Rotas

| Método | Rota                                                        | Auth | Role              |
|--------|-------------------------------------------------------------|------|-------------------|
| POST   | `/auth/create-user`                                         | Não  | —                 |
| POST   | `/auth/login`                                               | Não  | —                 |
| GET    | `/auth/me`                                                  | Sim  | qualquer          |
| PUT    | `/auth/modify-user/{id}`                                    | Sim  | próprio ou admin  |
| DELETE | `/auth/delete-user/{id}`                                    | Sim  | próprio ou admin  |
| GET    | `/users/{id}`                                               | Não  | —                 |
| GET    | `/posts`                                                    | Não  | —                 |
| GET    | `/posts/{id}`                                               | Não  | —                 |
| POST   | `/posts`                                                    | Sim  | admin             |
| POST   | `/posts/{post_id}/comments`                                 | Sim  | qualquer          |
| GET    | `/posts/{post_id}/comments/{comment_id}/replies`            | Não  | —                 |
| POST   | `/posts/{post_id}/comments/{comment_id}/like`               | Sim  | qualquer          |
| POST   | `/posts/{post_id}/comments/{comment_id}/dislike`            | Sim  | qualquer          |

---

## Requisitos Funcionais

### Autenticação e Perfil
- Tela de login, registro e logout
- Tela de edição de perfil: foto, email, senha e biografia
- Tela de perfil público com nome, posts, bio, foto e cargo

### Posts
- Paginação de posts
- Botão de pesquisa por título
- Filtro por tópicos/tipo
- Exibir nome do autor e tópico do post
- Somente admin pode criar posts
- Título obrigatório (suporta markdown)
- Conteúdo obrigatório (suporta markdown)

### Comentários
- Posts possuem comentários com like e dislike
- Comentários podem ter respostas aninhadas (modelo threaded, estilo Reddit)
- Paginação de comentários e respostas
- Somente usuários logados podem comentar

---

## Requisitos Não Funcionais

| Requisito        | Descrição                                                        |
|------------------|------------------------------------------------------------------|
| Sanitização      | Todos os inputs devem ser sanitizados antes de persistir         |
| Portabilidade    | A aplicação deve funcionar em diferentes ambientes               |
| Autenticação     | JWT para todas as rotas protegidas                               |
| Observabilidade  | Logs estruturados e rastreamento de erros                        |
| Usabilidade      | Interface intuitiva e responsiva                                 |
| Feedback         | Respostas claras ao usuário para ações de sucesso e erro         |
