---
trigger: always_on
---

# PROTOCOLO DE DOCUMENTACIÓN PROACTIVA Y CONFORMIDAD

Este protocolo define el ciclo operativo obligatorio de la IA en relación con la documentación del proyecto. Es un protocolo operativo, no filosófico — cada paso es verificable.

## PASO 0: LECTURA OBLIGATORIA AL INICIO DE SESIÓN

Antes de la primera solicitud de implementación en cada sesión nueva, la IA DEBE:

1. Leer `docs/MEMORY.md` completo (bóveda de heurísticas transferibles)
2. Leer `docs/MASTER-SPEC.md` completo (fuente de verdad del proyecto)
3. Si existe `docs/TEST.md`, leerlo para conocer los triggers de testing autónomo

Si alguno de estos archivos no existe o está vacío, notificar al usuario una sola vez y continuar.

## CICLO BEFORE/DURING/AFTER

### BEFORE (antes de escribir código)

1. Verificar que `docs/TODO.md` refleja la tarea que se va a implementar
2. Verificar que la tarea no contradice `docs/MASTER-SPEC.md` §4 (Restricciones) ni §5 (Trade-offs)
3. Si la tarea no está en TODO.md → añadirla antes de implementar
4. Leer `docs/MASTER-SPEC.md` §4 (Restricciones y Decisiones de Diseño) — la implementación no puede violar ningún límite intransgredible listado ahí

### DURING (mientras se escribe código)

1. Articular proactivamente incertidumbres y trade-offs en decisiones de alto costo de reversibilidad, sin esperar a que el usuario pregunte
2. Al encontrar una decisión técnica con opciones igualmente válidas → referenciar `docs/MASTER-SPEC.md` §5 (Trade-offs Acordados) y §6 (Sacrificio Aceptado) como criterio de desempate
3. Si la implementación crea deuda técnica consciente → documentar inmediatamente en el chat

### AFTER (después de completar trabajo)

1. Actualizar `docs/TODO.md` con timestamp (YYYY-MM-DD HH:MM:SS) en las tareas completadas
2. Si el trabajo cambió la arquitectura o stack → actualizar `docs/MASTER-SPEC.md` §2
3. Si se tomó una decisión significativa → redactar entrada para `docs/USER-DECISIONS.md` y presentar al usuario para confirmación
4. Si el skill `ciclo-testing-autonomo` está activo y el trabajo coincide con un trigger de `docs/TEST.md` → ejecutar tests correspondientes

## CHECK DE CONFORMIDAD

Antes de declarar una tarea como completada, verificar mentalmente las 5 cualidades del artefacto:

1. **Robustez**: ¿sobrevive a inputs inesperados?
2. **Sostenibilidad**: ¿el costo de mantenerlo es proporcional a su valor?
3. **Modificabilidad**: ¿otro developer (o la IA en sesión futura) podría entender y modificar esto sin esfuerzo desproporcionado?
4. **Velocidad de Creación**: ¿se completó en un tiempo razonable sin over-engineering?
5. **Potencial de Crecimiento**: ¿la estructura permite evolución sin reescritura?

Si alguna cualidad falla claramente → proponer corrección antes de cerrar la tarea.

## PROTOCOLO ANTI-SESGO PARA MEMORY.md

Antes de escribir una heurística en `docs/MEMORY.md`:

1. Verificar con búsqueda web si el patrón observado es generalizable
2. Si encuentra confirmación externa → escribir con fuente citada
3. Si NO encuentra confirmación → **declarar en el chat al usuario**: "Observé un patrón [X]. No encontré confirmación externa. ¿Confirmas que merece ser memorizado?"
4. Si el usuario confirma → escribir con tag `[Confirmado por usuario - sin fuente externa]`
5. Si el usuario no confirma → no escribir en MEMORY.md
