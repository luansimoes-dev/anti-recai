## Descrição

<!-- Explique o que foi feito neste PR. Seja objetivo mas completo. -->

## Tipo de mudança

- [ ] ✨ Feature — nova funcionalidade
- [ ] 🐛 Fix — correção de bug
- [ ] 🔧 Refactor — refatoração sem mudança de comportamento
- [ ] 📄 Docs — documentação
- [ ] 🧪 Test — adição ou correção de testes
- [ ] 🔒 Security — correção de vulnerabilidade
- [ ] ⚙️ Config — mudança de configuração/infra

## Issue relacionada

Closes #<!-- número da issue -->

---

## Contexto e motivação

<!-- Por que essa mudança é necessária? Qual problema resolve ou qual valor entrega?
     Se for uma feature, descreva o caso de uso. Se for um fix, descreva a causa raiz. -->

## O que foi alterado

<!-- Liste os principais arquivos/componentes alterados e o que mudou em cada um.
     Exemplo:
     - `UserService.java` — adicionado método de validação de token expirado
     - `AuthController.java` — novo endpoint POST /auth/refresh
     - `application.yml` — nova propriedade jwt.refresh-expiration -->

-
-
-

## Camada(s) afetada(s)

- [ ] Controller / Endpoint
- [ ] Service / Regra de negócio
- [ ] Repository / Banco de dados
- [ ] Model / Entidade
- [ ] Segurança / Autenticação / Autorização
- [ ] Configuração
- [ ] Testes
- [ ] Frontend

## Mudanças na API

<!-- Houve alguma mudança em endpoints, contratos de request/response ou comportamento da API?
     Se sim, descreva abaixo. Se não, apague esta seção. -->

| Campo | Antes | Depois |
|-------|-------|--------|
|       |       |        |

**Endpoint(s) afetado(s):**

```
<!-- Exemplo: POST /api/v1/auth/login -->
```

**Mudança é breaking change?** Sim / Não

## Banco de dados

<!-- Houve alguma mudança no schema (migrations, novas tabelas, colunas, índices)?
     Se sim, descreva. Se não, apague esta seção. -->

- [ ] Nenhuma mudança no banco
- [ ] Nova migration adicionada
- [ ] Migration destrutiva (drop, rename, alter) — **requer atenção especial**

Descrição da migration (se aplicável):

## Testes

<!-- Descreva como as mudanças foram testadas. -->

- [ ] Testes unitários adicionados/atualizados
- [ ] Testes de integração adicionados/atualizados
- [ ] Testado manualmente (descreva o cenário abaixo)

**Cenário de teste manual (se aplicável):**

```
<!-- Exemplo:
1. POST /api/v1/auth/login com credenciais válidas → 200 OK com token
2. GET /api/v1/posts com Authorization: Bearer <token> → 200 OK com lista
3. GET /api/v1/posts sem token → 401 NOAUTH
-->
```

**Cobertura de testes:** mantida / aumentada / diminuída (justifique se diminuiu)

## Checklist

- [ ] O código compila sem erros (`./mvnw clean package`)
- [ ] Todos os testes passam (`./mvnw test`)
- [ ] Não há `System.out.println` ou logs de debug esquecidos
- [ ] Variáveis de ambiente/secrets não foram hardcoded
- [ ] Endpoints privados estão devidamente protegidos com autenticação JWT
- [ ] Respostas de erro seguem o padrão definido na spec (`name`, `description`, `solution`, `requestedAt`)
- [ ] Timestamps seguem RFC 3339 no body e RFC 7231 nos headers
- [ ] Campos JSON seguem camelCase
- [ ] Documentação atualizada (se necessário)
- [ ] Self-review feito antes de abrir o PR

## Screenshots / Evidências

<!-- Se aplicável, adicione prints, logs ou outputs que evidenciem o funcionamento correto.
     Para APIs, um curl ou resposta do Postman/Insomnia é suficiente. -->

## Notas para o revisor

<!-- Algum ponto específico que merece atenção? Decisões de design que precisam de discussão?
     Dívidas técnicas introduzidas intencionalmente? -->
