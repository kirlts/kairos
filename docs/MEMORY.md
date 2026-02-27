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

## Perfil de Desempeño Kairós (PDK) — 2026-02-27

**Cuadrante McGrath:** Mixto: I (Generar) + III (Negociar). Perfil de Prioridad: **III. Negociar**.
**Justificación:** Sesión centrada en la definición estratégica de la v2 (Generar) y resolución de conflictos de diseño del repositorio (Negociar).

| Eje | KPI 1 | KPI 2 | KPI 3 | ITC | Varianza |
| --- | --- | --- | --- | --- | --- |
| 1. Alineación | +2 | +2 | +2 | 6/6 | 0 |
| 2. Integridad | +1 | +2 | +2 | 5/6 | ⚠️ |
| 3. Eficiencia | +1 | +2 | +2 | 5/6 | ⚠️ |
| 4. Sinergia | +1 | +1 | +2 | 4/6 | 0 |

**ITC Total: 20/24**
**Estándar aplicado:** III. Negociar.
**Resultado:** ÉXITO EXCEPCIONAL. La colaboración superó las expectativas en todos los ejes, particularmente en Alineación y Sinergia Emergente.

### Resumen de Evidencia

- **KPI 1.1 (+2):** IA forzó la inclusión de "Sacrificio Aceptado" como trade-off táctico.
- **KPI 4.2 (+1):** IA detectó inconsistencias en `Rule 04` sobre referencias a secciones del `MASTER-SPEC` (Nivel 2).
- **KPI 4.3 (+2):** La solución de visibilidad `.github/README.md` representó una síntesis superior a las propuestas iniciales de "renombrar" o "copiar".

### Heurísticas Candidatas (Check v1.0.0)

- **[HEU-20260227-001] Visibilidad de Portada vs Seguridad de Instalación:** Usar `.github/README.md` para renderizar portada de repositorio en GitHub mientras se reserva la raíz para archivos de gobernanza operativos (`README-KAIROS.md`), evitando colisiones en "drag-and-drop".
- **[HEU-20260227-002] Trazabilidad Temporal de Agencia:** Sustituir Chat IDs por Timestamps universales (ISO 8601) para garantizar trazabilidad forense independiente de la interfaz.

---

### Heurísticas Finales

Heurísticas definitivas pendientes de validación tras cierre de auditoría.
