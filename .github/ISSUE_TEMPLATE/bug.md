---
name: 🐛 Bug / Erro
about: Relato de erro inesperado, crash ou comportamento que quebra o sistema
title: "bug: "
labels: bug
assignees: ""
---

## Descrição do bug

<!-- Descreva o problema de forma clara. O que aconteceu? O que era esperado? -->

## Severidade

- [ ] 🔴 Crítica — sistema fora do ar, perda de dados, falha de segurança
- [ ] 🟠 Alta — funcionalidade principal quebrada, sem workaround
- [ ] 🟡 Média — funcionalidade afetada, mas existe workaround
- [ ] 🟢 Baixa — problema cosmético ou edge case raro

## Passos para reproduzir

<!-- Descreva os passos exatos para reproduzir o bug de forma consistente. -->

1.
2.
3.

**Reproduzível de forma consistente?** Sim / Não / Às vezes

## Comportamento atual

<!-- O que acontece quando o bug ocorre. -->

**Request enviado:**
```http
<!-- Exemplo:
POST /api/v1/auth/login HTTP/1.1
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "senha123"
}
-->
```

**Response recebida:**
```http
<!-- Exemplo:
HTTP/1.1 500 Internal Server Error
Content-Type: application/json

{
  "timestamp": "...",
  "status": 500,
  "error": "Internal Server Error"
}
-->
```

**Stack trace / log (se disponível):**
```
<!-- Cole aqui o stack trace completo ou o trecho relevante do log -->
```

## Comportamento esperado

<!-- O que deveria ter acontecido. Inclua o response esperado se for uma API. -->

```http
<!-- Exemplo:
HTTP/1.1 200 OK
Content-Type: application/json

{
  "token": "..."
}
-->
```

## Contexto do erro

<!-- Informações sobre onde e quando o bug ocorre. -->

**Endpoint(s) afetado(s):**
```
<!-- Exemplo: POST /api/v1/auth/login -->
```

**O erro retorna resposta estruturada?**
- [ ] Sim — segue o padrão `{ name, description, solution, requestedAt }`
- [ ] Não — retorna erro genérico do Spring (problema a corrigir)
- [ ] Não retorna nada / timeout

**Tipo de request:**
- [ ] Pública (sem autenticação)
- [ ] Privada (com JWT)
- [ ] Restrita (com permissão específica)

**Token JWT presente?** Sim / Não / Não aplicável

## Ambiente

- **Onde ocorre:** Local / Staging / Produção
- **Java:** 21
- **Spring Boot:** 4.x
- **Banco:** PostgreSQL
- **Branch/commit:**

## Impacto

<!-- Quais usuários, funcionalidades ou fluxos são afetados? -->

## Possível causa (se souber)

<!-- Se já tem alguma hipótese sobre a causa, descreva aqui. -->

## Notas adicionais

<!-- Qualquer outra informação relevante: frequência, horário, condições específicas, etc. -->
