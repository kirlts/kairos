# Documentación y ciclo operativo

## Eje documental

Todos los documentos rectores del proyecto residen en `/docs/`. Las plantillas canónicas residen en `.agents/templates/`. Al crear un documento nuevo, se copia la plantilla correspondiente y se puebla con el contenido del proyecto.

| Documento | Template | Propósito |
|---|---|---|
| `docs/MASTER-SPEC.md` | `.agents/templates/master-spec.md` | Especificación técnica y arquitectónica. Todo lo implementado va en favor de este archivo |
| `docs/TODO.md` | `.agents/templates/todo.md` | Tareas con trazabilidad a MASTER-SPEC §8. Timestamps obligatorios (YYYY-MM-DD HH:MM:SS) |
| `docs/MEMORY.md` | `.agents/templates/memory.md` | Heurísticas transferibles. Append-only |
| `docs/USER-DECISIONS.md` | `.agents/templates/user-decisions.md` | Decisiones humanas con formato ADR de 5 campos |
| `docs/CHANGELOG.md` | `.agents/templates/changelog.md` | Historial versionado. Formato Keep a Changelog |
| `docs/DEUDA-TECNICA.md` | `.agents/templates/deuda-tecnica.md` | Temporal. Se autoliquida al completarse al 100% |
| `docs/TEST.md` | (generado por /test) | Contrato de testing. Se lee si existe |

## Inicio de sesión

1. Verificar existencia de `/docs/` y documentos base. Si faltan, crear desde templates.
2. Leer `docs/MEMORY.md` completo.
3. Leer `docs/MASTER-SPEC.md`.
4. Si existe `docs/TEST.md`, leerlo.

## Ciclo de trabajo

**BEFORE:** La tarea existe en TODO.md antes de ejecutarse. Si afecta >1 archivo o modifica MASTER-SPEC §4/§5, generar `implementation_plan.md` con checklist.

**DURING:** Si surge una decisión con opciones válidas, referenciar MASTER-SPEC §5 para desempatar. Si se toma un atajo técnico, documentar inmediatamente.

**AFTER:** Validar el artefacto resultante. Ejecutar `/document` como cierre obligatorio. Actualizar TODO.md con timestamp solo tras validación y sincronización.

## Hermetismo del framework

Si el directorio de trabajo es el repositorio canónico de Kairós, los archivos dentro de `/docs/` se consideran plantillas maestras y no se modifican con información de sesión. Los registros efímeros van a áreas volátiles.

## Protocolo anti-sesgo de heurísticas

Antes de escribir una heurística en `docs/MEMORY.md`:
1. Verificar con búsqueda web si el patrón es generalizable.
2. Si hay confirmación externa, escribir con fuente citada.
3. Si no hay confirmación, declarar al usuario: «Observé un patrón [X]. No encontré confirmación externa. ¿Confirmas que merece ser memorizado?»
4. Si el usuario confirma, escribir con tag `[Confirmado por usuario - sin fuente externa]`.

## Terminal bypass

El límite de reintentos de comandos de terminal es 1. Al segundo intento, la ejecución directa está deshabilitada; la salida se redirige a archivo temporal y se inspecciona via herramientas de lectura.

## Fidelidad de workflows

Los workflows se ejecutan al pie de la letra, paso por paso, incluyendo workflows anidados en su interior. El parafraseo interno, la omisión de pasos, y la compresión de instrucciones de workflow están deshabilitados. Cada paso de un workflow produce un artefacto verificable antes de avanzar al siguiente.
