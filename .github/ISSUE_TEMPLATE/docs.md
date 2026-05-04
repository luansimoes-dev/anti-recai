---
name: 📄 Documentação
about: Criação, atualização ou correção de documentação
title: "docs: "
labels: documentation
assignees: ""
---

## Descrição

<!-- O que precisa ser documentado, atualizado ou corrigido? -->

## Tipo de documentação

- [ ] 📋 Spec de API — contratos de request/response, endpoints, erros
- [ ] 🗺️ Rotas — atualização do `docs/rotas.md`
- [ ] 📖 README — instruções de setup, uso, contribuição
- [ ] 🏗️ Arquitetura — decisões de design, diagramas, ADRs
- [ ] 🔧 Configuração — variáveis de ambiente, propriedades da aplicação
- [ ] 🧪 Testes — como rodar, estrutura, convenções
- [ ] 📝 Comentários no código — Javadoc, comentários inline

## Motivação

<!-- Por que essa documentação é necessária agora?
     Exemplo: nova feature implementada, comportamento mudou, doc está desatualizada, etc. -->

## O que precisa ser documentado

<!-- Descreva com precisão o que deve ser escrito ou atualizado.
     Se for uma atualização, indique o que está errado/desatualizado hoje. -->

**Arquivo(s) afetado(s):**
- `docs/`
- `README.md`
- Outro:

**Conteúdo atual (se for atualização):**
```
<!-- Cole aqui o trecho desatualizado ou incorreto -->
```

**Conteúdo esperado / proposta:**
```
<!-- Descreva ou esboce o que deve constar na documentação -->
```

## Contexto técnico relevante

<!-- Se a documentação envolve a API, inclua as informações necessárias:
     endpoints, contratos, padrões de erro, autenticação, etc. -->

**Padrões que devem ser refletidos na doc (se aplicável):**
- Erros seguem o padrão: `{ name, description, solution, requestedAt }`
- Timestamps no body: RFC 3339 | Timestamps em headers: RFC 7231
- Campos JSON: camelCase
- Autenticação: `Authorization: Bearer <token>` (RFC 6750)

## Critérios de aceite

- [ ] A documentação está precisa e reflete o comportamento atual do sistema
- [ ] Exemplos de request/response incluídos onde aplicável
- [ ] Linguagem clara e sem ambiguidades
- [ ] Links e referências funcionando

## Notas adicionais

<!-- Alguma referência externa, RFC, ou decisão de design que deve ser citada? -->
