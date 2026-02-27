---
description: /audit - Ejecuta la auditoría IMK 4.0 sobre la colaboración y genera el Perfil de Desempeño Kairós (PDK) en docs/MEMORY.md
---

# WORKFLOW: AUDITORÍA IMK 4.0

Este flujo de trabajo implementa el Instrumento de Medición Kairós (IMK) 4.0 para evaluar cualitativa y cuantitativamente la colaboración humano-IA de la sesión.

IMPORTANTE: El archivo IMK-4.0.md se encuentra en `.agent/IMK-4.0.md`. Léelo COMPLETO antes de ejecutar la auditoría.

## Paso 0: Viabilidad de la Auditoría

Antes de auditar, verificar:

1. ¿Hay suficiente historial de conversación para evaluar? (mínimo ~5 intercambios sustanciales)
2. ¿Se realizó trabajo substantivo (no solo preguntas de configuración)?

Si NO hay suficiente material → informar al usuario y detener. No auditar sesiones triviales.

## Paso 1: Clasificación del Cuadrante McGrath

Clasificar la sesión usando criterios **behavioral** — basados en evidencia observable en el log, no en juicios de calidad:

| Cuadrante | Indicador behavioral (observable en el log) |
| --- | --- |
| Creación-Producción | Se produjeron nuevos archivos, nuevo código, nueva arquitectura |
| Evaluación-Negociación | Se evaluaron opciones, se tomaron decisiones estratégicas, se definieron trade-offs |
| Análisis-Cognitivo | Se examinó código existente, se investigaron causas, se exploraron posibilidades |
| Refactorización-Ejecución | Se modificó código existente para mejorar sin cambiar comportamiento observable |

Si la sesión mezcla tipos: elegir el cuadrante dominante (>50%), anotar como "Mixto: X+Y" con justificación.

Declarar el Perfil de Prioridad correspondiente según la tabla del IMK 4.0.

## Paso 2: Puntuación Anotada (12 KPIs en Orden Estricto)

Evaluar los 4 Ejes del IMK 4.0 en este orden exacto, sin saltear ni reordenar:

### Eje 1: Alineación Estratégica

- KPI 1.1: Detección de Propósito Guía
- KPI 1.2: Vinculación de Tareas al Plan
- KPI 1.3: Detección de Desvío

### Eje 2: Integridad del Artefacto

- KPI 2.1: Robustez y Manejo de Edge Cases
- KPI 2.2: Sostenibilidad del Diseño
- KPI 2.3: Defensibilidad de Decisiones

### Eje 3: Eficiencia del Proceso

- KPI 3.1: Velocidad de Convergencia
- KPI 3.2: Reducción de Iteraciones Innecesarias
- KPI 3.3: Uso de Contexto Previo

### Eje 4: Sinergia Emergente

- KPI 4.1: Elevación del Problema
- KPI 4.2: Fricción Productiva Aplicada
- KPI 4.3: Sinergia Emergente

**REGLA ESTRICTA DE EVIDENCIA:** Para cada KPI, DEBES:

1. Citar textualmente (entre comillas) un fragmento del historial que justifique el score
2. Asignar score en escala -2 a +2
3. Si no encuentras evidencia textual → score debe ser 0 con nota "Sin evidencia suficiente"

## Paso 3: Generación de la Tabla PDK con ITC

Generar la tabla de scores usando el formato ITC (Índice de Tendencia Central):

```markdown
## Perfil de Desempeño Kairós (PDK) — [fecha]

**Cuadrante McGrath:** [cuadrante] ([justificación])

| Eje | KPI 1 | KPI 2 | KPI 3 | ITC | Varianza |
|-----|-------|-------|-------|-----|----------|
| 1. Alineación | | | | /6 | |
| 2. Integridad | | | | /6 | |
| 3. Eficiencia | | | | /6 | |
| 4. Sinergia | | | | /6 | |

**ITC Total:** /24
**Estándar aplicado:** [tabla del cuadrante McGrath]
```

Si hay un score negativo dentro de un eje → marcar varianza con ⚠️ dispersión.

## Paso 4: Consecuencias y Meta-Gobernanza

**Si Eje 1 o Eje 2 tienen ITC ≤ 0:**

- ACCIÓN A: Generar plan de corrección técnica con pasos específicos
- ACCIÓN B: Analizar si la estrategia de gobernanza falló y proponer modificación a `.agent/rules/`

**Si Eje 4 tiene ITC ≥ 4:**

- Documentar los momentos de sinergia emergente identificados como heurísticas candidatas para MEMORY.md (aplicar protocolo anti-sesgo del Rule 04)

## Paso 5: Cierre de Auditoría

1. Añadir el PDK cronológicamente al final de `docs/MEMORY.md`
2. Si se identificó deuda técnica → crear entrada en `docs/DEUDA-TECNICA.md` (si existe)
3. Si se identificaron decisiones significativas no documentadas → redactar entradas para USER-DECISIONS.md
