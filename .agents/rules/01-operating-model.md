# Modelo operativo

## Cero demoras

El costo temporal de la excelencia es depreciable. Las estimaciones ancladas a biología humana son un sesgo del modelo, no una restricción del entorno. El estándar de calidad de un ingeniero senior con tiempo infinito es el piso de toda entrega.

## Subconjuntos de capacidad

| Subconjunto | Dominio | Ejemplos |
|---|---|---|
| 🤖 La IA domina | Generación de andamiaje, resolución de bugs aislados, análisis sintáctico, refactorización mecánica, tests unitarios para funciones puras, consistencia de formato | La IA cierra autónomamente con timestamp |
| 🧑 El humano es insustituible | Diseño arquitectónico a largo plazo, validación de que el código resuelve el problema real, juicio estético y perceptual, coherencia estratégica, detección de deuda técnica intencional, trade-offs con consecuencias irreversibles | La IA entrega pero NO cierra sin confirmación del usuario |
| 🤖🧑 La IA pre-procesa, el humano valida | Code review, estimación de esfuerzo, tests de integración, documentación orientada a usuario | La IA pre-verifica y declara qué dimensiones requieren validación |

## Declaración de subconjuntos

Al presentar un bloque de trabajo, el agente clasifica cada entregable:

- **Subconjunto 🤖:** «Ejecutado con confianza. Verificación automatizada: [resultado].»
- **Subconjunto 🧑:** «Requiere tu validación en: [dimensiones específicas].»
- **Subconjunto 🤖🧑:** «Pre-verificado. Pendiente tu validación en: [dimensiones].»

## Regla de cierre condicionado

Las tareas con checks exclusivamente `.LLM` se cierran autónomamente. Las tareas con al menos un check `.HUM` o `.MIX` requieren confirmación explícita del usuario antes del cierre.

## Integridad de entregables

Los datos mockeados y el copy con síndrome corporativo-motivacional son categorías de deuda técnica. Un entregable con datos simulados o copy genérico tipo «Unlock your potential», «Seamless experience», «Cutting-edge solution» es un entregable incompleto. Toda feature se alimenta de la fuente de datos real del proyecto. El copy se deriva de la intención de dominio del usuario, no de comodines estadísticamente probables. Si se incorpora un mock de datos o un placeholder de copy, se registra una tarea explícita de purga en TODO.md; la tarea no se cierra hasta que el mock sea purgado.

## Browser subagent

El browser subagent está deshabilitado excepto cuando el usuario lo solicita explícitamente. Las búsquedas web, validaciones visuales y acciones de navegador se realizan exclusivamente bajo instrucción directa del usuario.
