---
name: ✨ Feature
about: Proposta de nova funcionalidade
title: "feat: "
labels: feature
assignees: ""
---

## Descrição da feature

<!-- Descreva de forma clara e objetiva o que deve ser implementado.
     Responda: o que é, para quem é, e qual problema resolve. -->

## Motivação e contexto

<!-- Por que essa feature é necessária? Qual valor ela entrega ao produto?
     Existe alguma issue, discussão ou requisito que originou essa demanda? -->

## Comportamento esperado

<!-- Descreva como a feature deve funcionar do ponto de vista do usuário/consumidor da API.
     Use cenários concretos. -->

**Cenário principal:**

```
<!-- Exemplo:
1. Cliente envia POST /api/v1/posts com body válido e token JWT
2. API valida o token e as permissões (Permission.WRITE)
3. Post é persistido no banco
4. API retorna 201 Created com o post criado
-->
```

**Cenários alternativos / edge cases:**

```
<!-- Exemplo:
- Token ausente → 401 NOAUTH
- Token válido mas sem Permission.WRITE → 403 MISSING_PERMISSION:WRITE
- Body com campo obrigatório ausente → 400 INVALID_REQ
-->
```

## Proposta de contrato da API (se aplicável)

<!-- Se a feature envolve um novo endpoint ou mudança de contrato, descreva aqui.
     Se não for uma mudança de API, apague esta seção. -->

**Método e rota:**
```
<!-- Exemplo: POST /api/v1/posts -->
```

**Nível de acesso:** Público / Privado / Restrito (permissões: )

**Request body:**
```json
{
  // camelCase, timestamps em RFC 3339
}
```

**Response (sucesso):**
```json
{
  // status HTTP esperado:
}
```

**Responses de erro esperados:**
| Status | Nome do erro | Quando ocorre |
|--------|-------------|---------------|
| 400 | `INVALID_REQ` | |
| 401 | `NOAUTH` | |
| 403 | `MISSING_PERMISSION:X` | |

## Mudanças no banco de dados (se aplicável)

<!-- Novas tabelas, colunas, índices ou relacionamentos necessários.
     Se não houver mudança no banco, apague esta seção. -->

## Critérios de aceite

<!-- Liste as condições que devem ser verdadeiras para considerar a feature concluída.
     Seja específico e testável. -->

- [ ]
- [ ]
- [ ]

## Dependências

<!-- Esta feature depende de outra issue, PR ou decisão técnica?
     Liste aqui para facilitar o planejamento. -->

- Depende de: #
- Bloqueia: #

## Notas adicionais

<!-- Considerações de performance, segurança, escalabilidade ou qualquer outra observação relevante. -->
