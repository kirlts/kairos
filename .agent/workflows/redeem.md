---
description: /redeem - Auditoría y remediación de deuda técnica con investigación de estándares
---

# WORKFLOW: REDENCIÓN DE DEUDA TÉCNICA

Este workflow permite auditar la deuda técnica de un proyecto existente (brownfield) y generar un plan de remediación basado en estándares actuales.

## Fase 1: Inventario de Deuda Técnica

1. **Leer MASTER-SPEC** para entender la arquitectura actual y sus restricciones
2. **Analizar el codebase**: identificar patrones de deuda técnica visibles:
   - Dependencias obsoletas o con vulnerabilidades conocidas
   - Código sin tests
   - Configuración hardcodeada
   - Patrones de diseño inconsistentes
   - Archivos sin propósito claro (¿por qué existe esto?)

3. **Aplicar la Valla de Chesterton**: antes de proponer eliminar o cambiar algo, preguntar "¿quién puso esto aquí y por qué?" Si no hay respuesta visible en el código o la documentación → preguntar al usuario antes de proponer cambio.

4. **Generar o actualizar `docs/DEUDA-TECNICA.md`** con el inventario:

```markdown
# DEUDA-TECNICA.md

## Inventario — [fecha]

| ID | Tipo | Descripción | Severidad | Cuadrante Fowler | Valla Chesterton |
| --- | --- | --- | --- | --- | --- |
| DT-001 | Dependencia | | Alta/Media/Baja | Prudente-Deliberada / Imprudente-Inadvertida | ¿Entendida? Sí/No |
```

## Fase 2: Investigación de Estándares

Para CADA item de deuda con severidad Alta o Media, ejecutar el skill `investigacion-estandar` completo (5 pasos):

1. Declaración de ignorancia controlada
2. 3 búsquedas web obligatorias
3. Filtro de calidad de fuentes
4. Triangulación
5. Tabla comparativa

Presentar resultados al usuario antes de proponer remedios.

## Fase 3: Plan de Redención

Generar un plan priorizado de remediación:

1. Items que se pueden resolver sin cambio de arquitectura (quick wins)
2. Items que requieren refactoring significativo
3. Items que requieren decisión del usuario (trade-off)

Para cada item:

- Acción propuesta
- Esfuerzo estimado (S/M/L)
- Riesgo de regresión
- ¿Requiere actualización de MASTER-SPEC? Sí/No

## Cierre

- Actualizar `docs/TODO.md` con las tareas de remediación aceptadas
- Actualizar `docs/USER-DECISIONS.md` si el usuario descartó alguna remediación
- Copiar restricciones tecnológicas nuevas a `.agent/rules/03-restricciones-tecnologicas.md`
