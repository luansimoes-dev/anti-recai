---
name: 🔧 Fix / Refactor
about: Correção de comportamento incorreto ou refatoração de código existente
title: "fix: "
labels: fix
assignees: ""
---

## Descrição

<!-- O que precisa ser corrigido ou refatorado? Seja direto. -->

## Tipo

- [ ] 🐛 Correção de comportamento incorreto (bug que não causa crash)
- [ ] 🔧 Refatoração — melhoria interna sem mudança de comportamento externo
- [ ] ⚡ Performance — otimização de query, cache, processamento
- [ ] 🔒 Segurança — correção de vulnerabilidade

## Comportamento atual

<!-- Descreva o que está acontecendo hoje. Inclua exemplos concretos:
     request enviado, resposta recebida, log de erro, etc. -->

**Exemplo do problema:**
```
<!-- Exemplo:
Request: GET /api/v1/posts?page=-1
Response esperada: 400 INVALID_REQ
Response atual: 500 Internal Server Error
-->
```

## Comportamento esperado

<!-- Descreva como deveria funcionar após a correção. -->

## Causa raiz (se conhecida)

<!-- Se já identificou onde está o problema no código, descreva aqui.
     Classe, método, query, configuração, etc. -->

## Impacto

<!-- Quais partes do sistema são afetadas por esse problema?
     Quantos usuários/endpoints são impactados? -->

- Endpoints afetados:
- Severidade: Baixa / Média / Alta / Crítica
- Frequência: Sempre / Às vezes / Raramente

## Passos para reproduzir

<!-- Como reproduzir o problema de forma consistente. -->

1.
2.
3.

**Ambiente onde foi reproduzido:** Local / Staging / Produção

## Proposta de solução (se houver)

<!-- Se já tem uma ideia de como corrigir, descreva aqui.
     Não é obrigatório — pode ser deixado para quem for implementar. -->

## Critérios de aceite

- [ ] O comportamento incorreto não ocorre mais
- [ ] Testes cobrindo o cenário corrigido foram adicionados
- [ ] Nenhum comportamento existente foi quebrado (regressão)

## Notas adicionais

<!-- Logs, stack traces, links para discussões relacionadas, etc. -->

```
<!-- Cole aqui stack traces ou logs relevantes -->
```
