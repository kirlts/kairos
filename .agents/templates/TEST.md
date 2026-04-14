# Estrategia de Testing

> Generado por `/test` (Modo 1). Este archivo es el contrato de testing del proyecto.

## Stack de Testing

| Capa | Runner | Justificación |
|---|---|---|
| Tests unitarios | [ej: vitest, pytest, go test] | [por qué este runner para este proyecto] |
| Tests de integración | [ej: supertest, pytest, vitest] | [por qué esta herramienta] |
| Tests E2E / visuales | [ej: Playwright, ninguno] | [por qué sí o no E2E] |
| Mocking | [estrategia: mocks manuales, msw, fixtures] | [por qué esta estrategia] |

## Triggers Automáticos

<!-- Condiciones bajo las cuales la IA ejecuta tests sin petición explícita -->

| Trigger | Subconjunto a ejecutar |
|---|---|
| Modificación de [componente/módulo crítico] | [qué tests correr] |
| Modificación de [archivos/patrones específicos] | [qué tests correr] |
| Cierre de tarea que afecta [área] | [qué tests correr] |

## Tests de Alta Prioridad (Límites Intransgredibles)

<!-- Tests que validan que NO se viole un Límite Intransgredible de MASTER-SPEC §4 -->

| ID | Descripción | Referencia MASTER-SPEC | Verificador |
|---|---|---|---|
| HP-001 | [Descripción del test] | §4.[N] | 🤖 .LLM / 🧑 .HUM / 🤖🧑 .MIX |

## Tests de Regresión

<!-- Se añaden cuando debugging revela un bug. Cada entrada documenta el bug original para evitar recurrencia -->

| ID | Bug original | Test de regresión | Fecha |
|---|---|---|---|
| REG-001 | [Qué falló y por qué] | [Qué verifica el test] | [YYYY-MM-DD] |

## Política de E2E

- **Activar cuando:** [condiciones que justifican E2E, ej: cambios en flujos de usuario visibles]
- **No activar cuando:** [condiciones donde E2E no aporta, ej: cambios puramente internos]
- **Scope:** [qué flujos cubre E2E, referenciados a MASTER-SPEC]

## Métricas de Cobertura

| Métrica | Valor actual | Target |
|---|---|---|
| Cobertura de líneas | [%] | [%] |
| Tests de alta prioridad pasando | [N/M] | M/M |
| Tests de regresión | [N] | N/A (crece orgánicamente) |
