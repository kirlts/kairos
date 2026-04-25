# REPOMAP: [INSERT_PROJECT_NAME]

> Generado: [INSERT_TIMESTAMP] (Kairós v[INSERT_VERSION])  
> Propósito: Mapa de enrutamiento. Define cuándo la IA está autorizada a leer cada directorio o archivo.

## Matriz de Enrutamiento

| Directorio / Archivo | Naturaleza | Cuándo Consultar |
|---|---|---|
| `docs/MASTER-SPEC.md` | Especificaciones arquitectónicas, límites y trade-offs. | Tareas de diseño (.HUM) o integración de nuevos módulos. |
| `docs/MEMORY.md` | Heurísticas y errores históricos aprendidos. | Implementación de lógicas complejas o propensas a fallos. |
| `docs/VERIFICATION.md` | Contrato de calidad y criterios de aceptación. | Validación previa a la entrega de código. |
| `docs/TODO.md` | Repositorio de tareas activas e histórico. | Sólo para registro de avance o lectura de requisitos de un TASK. |
| `.agents/skills/` | Protocolos de ejecución especializados. | Tareas de UI (visual-excellence) o estancamiento (conflict-resolution). |
[INSERT_TOPOLOGY_ROWS]
