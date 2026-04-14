---
description: /document - Sincroniza el eje documental (MASTER-SPEC, TODO, MEMORY, USER-DECISIONS, CHANGELOG) con el estado real del proyecto. En sesiones sin trabajo previo, ejecuta auditoría completa de sincronización contra las plantillas vigentes.
---

# Sincronización documental

Este workflow asegura que toda la documentación del proyecto refleja fielmente el estado actual del código y la arquitectura.

## Detección de modo

- Si la sesión tiene trabajo previo (código modificado, tareas ejecutadas): **Modo Normal** (sincronización incremental).
- Si la sesión no tiene trabajo previo (el usuario invocó `/document` como primera acción, o se ejecuta como cierre de `/fix`, `/derive`, etc.): **Modo Auditoría** (verificación completa contra plantillas vigentes).

---

## Modo Auditoría (cold-start)

Se ejecuta cuando `/document` se invoca sin contexto de trabajo previo. Su propósito es detectar divergencias entre la documentación existente y las plantillas vigentes en `.agents/templates/`.

### Paso 1: Inventariar documentación existente

Escanear `docs/` buscando los archivos del eje documental:

| Archivo | Template canónica | Obligatorio |
|---|---|---|
| `docs/MASTER-SPEC.md` | `.agents/templates/master-spec.md` | Sí |
| `docs/TODO.md` | `.agents/templates/todo.md` | Sí |
| `docs/MEMORY.md` | `.agents/templates/memory.md` | Sí |
| `docs/USER-DECISIONS.md` | `.agents/templates/user-decisions.md` | Sí |
| `docs/CHANGELOG.md` | `.agents/templates/changelog.md` | Sí |
| `docs/TEST.md` | `.agents/templates/TEST.md` | No (se crea con `/test`) |
| `docs/DEUDA-TECNICA.md` | `.agents/templates/deuda-tecnica.md` | No (se crea con `/fix`) |

### Paso 2: Catalogar discrepancias

Para cada archivo existente, comparar contra su template canónica. Clasificar cada discrepancia:

| Tipo | Descripción | Ejemplo |
|---|---|---|
| **Archivo faltante** | Un archivo obligatorio no existe | `docs/USER-DECISIONS.md` no existe |
| **Sección faltante** | El archivo existe pero le faltan secciones que la template define | MASTER-SPEC sin §1.Identidad, o sin campos "Problema que resuelve" |
| **Formato legacy** | El archivo existe pero usa un formato incompatible con la template vigente | TODO sin taxonomía `[EPIC-NNN]`/`[TASK-NNN]`, MEMORY sin formato `[HEU-NNN]` |
| **Contenido stale** | El archivo existe y tiene formato correcto pero su contenido contradice el código | MASTER-SPEC lista un módulo que ya no existe |
| **Slop detectado** | El archivo contiene patrones de escritura IA (ver sección Detección de slop) | Sección con "cutting-edge solution" |

### Paso 3: Decidir acción por discrepancia

Algoritmo de decisión para cada discrepancia catalogada:

```
¿El archivo existe?
  NO → Crear desde template. Acción autónoma.
  SÍ →
    ¿La corrección destruye contenido que el usuario escribió?
      NO (ej: añadir sección faltante, añadir campo nuevo, inyectar taxonomía):
        → Ejecutar Soft-Update autónomamente. No solicitar aprobación.
      SÍ (ej: reestructurar secciones existentes, renombrar IDs, archivar y reconstruir):
        → Catalogar como "requiere aprobación". Presentar diff al usuario.
    ¿La corrección modifica IDs referenciados por otros archivos?
      SÍ → Requiere aprobación. Presentar mapa de impacto.
      NO → Autónomo si no destruye contenido.
```

### Paso 4: Ejecutar correcciones

1. Ejecutar todas las correcciones autónomas de una vez.
2. Presentar lista de correcciones que requieren aprobación con diffs concretos.
3. Esperar confirmación del usuario para las destructivas.

### Paso 5: Reporte

Generar tabla consolidada:

| Documento | Discrepancia | Tipo | Acción | Estado |
|---|---|---|---|---|
| [archivo] | [qué diverge] | [faltante/legacy/stale/slop] | [qué se hizo o qué se propone] | ✅ Corregido / ⏳ Pendiente aprobación |

---

## Modo Normal (sincronización incremental)

Se ejecuta directamente sin pedir validación previa al usuario.

### Sincronización con código

Para cada documento, verificar coherencia con el estado actual del proyecto:

- ¿El MASTER-SPEC refleja la arquitectura real implementada?
- ¿El TODO.md refleja el progreso real con timestamps correctos?
- ¿Hay decisiones en el código que falten en USER-DECISIONS.md?
- ¿Hay cambios en el producto que no figuren en CHANGELOG.md?
- ¿Las restricciones de MASTER-SPEC §4 están sincronizadas con `.agents/rules/03-constraints.md`?

### Detección de slop y mocks

Verificar que no existan entregables marcados como «completos» que contengan:

| Categoría | Patrones de detección |
|---|---|
| **Copy corporativo-motivacional** | «Unlock your potential», «Seamless experience», «Cutting-edge solution», «Empower your workflow», «Transform your business», «Innovative platform», adjetivos vacíos de contenido específico |
| **Datos mockeados** | Constantes hardcodeadas que simulan datos reales, arrays de ejemplo sin conexión a fuente de datos, respuestas HTTP mockeadas presentadas como integración real |
| **Patrones RLHF en documentación** | «It's worth noting that», «Cabe destacar que», «Es importante señalar», negative parallelisms («not just X, but Y»), positividad servil |
| **Em dashes** | Cualquier instancia del carácter (—). Zero tolerance |

Si se detecta slop o mocks en features «completadas», reportar en la tabla de brechas y crear TASK de purga en TODO.md.

### Coherencia de Trazabilidad §8 ↔ TODO

Verificación cruzada obligatoria:

1. **Checks sin TASK:** ¿Hay checks en §8 no implementados sin TASK asociada? → Crear las TASKs faltantes.
2. **TASKs sin check:** ¿Hay TASKs que referencian IDs inexistentes en §8? → Corregir referencias o eliminar TASKs.
3. **Checks fantasma:** ¿Hay checks marcados como ✅ cuyo código ya no existe? → Desmarcar y crear TASK de reimplementación.
4. **Conteo de cobertura por actor:** Para cada actor en §8, contar checks implementados vs. pendientes. Registrar en tabla de resumen del TODO.

### Validación de Coherencia Cruzada

Verificar que no existan contradicciones internas:

- Intenciones/Propósitos en MASTER-SPEC §1 ↔ Épicas en TODO.md
- Restricciones en MASTER-SPEC §4 ↔ Reglas en `.agents/rules/03-constraints.md`
- Decisiones en USER-DECISIONS.md ↔ Trade-offs en MASTER-SPEC §5
- Checks en MASTER-SPEC §8 ↔ TASKs en TODO.md (bidireccional)

### Coherencia de Verificabilidad (🤖/🧑/🤖🧑)

Algoritmo determinista de 5 pasos:

**PASO 1. INVENTARIAR:** Leer MASTER-SPEC §8. Extraer todos los checks con su clasificador (.LLM/.HUM/.MIX). Construir tabla interna: `{Check_ID, Verificador, Estado}`.

**PASO 2. CRUZAR:** Leer TODO.md. Extraer todas las tareas y sus checks cubiertos. Construir tabla interna: `{Task_ID, [Check_IDs], Estado_Tarea, Tiene_Restricción_Cierre_Humano}`.

**PASO 3. VALIDAR COHERENCIA:** Para cada check donde Verificador = .HUM o .MIX:
- Buscar la tarea correspondiente en TODO.md.
- ¿La tarea tiene restricción de cierre humano (⇠ 🧑)? → NO: ⚠️ CONFLICTO.
- Si la tarea está marcada como completada: ¿Tiene timestamp de verificación humana? → NO: ⚠️ CONFLICTO.

**PASO 4. VALIDAR TIMESTAMPS:** Para cada check marcado como ✅ Implementado:
- ¿Incluye timestamp? → NO: ⚠️ CONFLICTO.
- ¿El tipo de verificación (🤖/🧑/🤖🧑) coincide con el clasificador del check? → NO: ⚠️ CONFLICTO.

**PASO 5. REPORTAR:** Generar resumen cuantitativo:

```
Checks totales: N
  - 🤖 .LLM: X (Y implementados, Z pendientes)
  - 🧑 .HUM: X (Y implementados, Z pendientes de validación humana)
  - 🤖🧑 .MIX: X (Y implementados, Z pendientes)
  - ⚠️ Conflictos de coherencia: N [listar]
```

Si se detectan checks sin sufijo de verificabilidad (legacy), clasificarlos retroactivamente usando el Árbol de Decisión del template `derive-working.md`. Si la operación es no destructiva (añadir sufijos), ejecutar autónomamente. Si es destructiva (renombrar IDs), requerir aprobación humana.
