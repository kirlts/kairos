# MEMORY: Bóveda de Meta-Heurísticas Kairós

> **Regla de oro (filtro de escritura):** Una entrada entra en MEMORY.md SOLO si responde
> "sí" a: "¿Esta heurística sería útil en cualquier repo que use Kairós, sin importar
> si es un e-commerce, una API REST, o un CLI en Rust?"
>
> Si la heurística es específica del proyecto actual → va a CHANGELOG.md o USER-DECISIONS.md.
>
> **Restricción crítica:** Este archivo es APPEND-ONLY. Nunca reducir, borrar ni sintetizar
> entradas previas. Solo añadir. La IA consulta este archivo antes de la primera
> solicitud de implementación en cada sesión.
>
> **Protocolo Anti-Sesgo:** Antes de escribir, verificar con búsqueda web. Si no hay
> confirmación externa, pedir confirmación al usuario en el chat. Ver Rule 04.

---

## Formato de Entrada

```markdown
### [HEU-YYYYMMDD-NNN] [Título descriptivo]
**Contexto:** [Situación en la que aplica]
**Heurística:** [La lección aprendida, en una oración accionable]
**Evidencia observada:** [Qué ocurrió que llevó a documentar esto]
**Anti-patrón evitado:** [Lo que NO hacer]
**Fuente:** [URL o "Confirmado por usuario - sin fuente externa"]
```

---

## Heurísticas

*Sin heurísticas registradas aún. Se pobla durante sesiones de desarrollo y /audit.*
