# Kairós — Sistema de Gobernanza para Desarrollo Asistido por IA

> **Versión:** v2.1.1
> **Metodología:** Kairós v2

## ¿Qué es Kairós?

Kairós es un sistema de gobernanza y colaboración diseñado para proyectos solo-dev o equipos pequeños que desarrollan con asistencia de IA. Eleva la colaboración Humano-IA del nivel de "asistencia táctica" al nivel de "socio estratégico", asegurando la integridad del artefacto, la sostenibilidad del proceso y el crecimiento del desarrollador.

**La opinión de Kairós:** La calidad del artefacto es un lagging indicator de la calidad del diálogo. La complacencia de la IA es un riesgo sistémico. La agencia humana es un recurso escaso que el sistema debe preservar activamente.

## Componentes del Sistema

| Componente | Ubicación | Función |
| --- | --- | --- |
| Eje documental | `docs/` | MASTER-SPEC, TODO, MEMORY, CHANGELOG, USER-DECISIONS |
| Reglas operativas | `.agent/rules/` | Protocolos de comportamiento y física del sistema |
| Workflows | `.agent/workflows/` | Flujos de trabajo estructurados (/kairos, /derive, /test, etc.) |
| Skills | `.agent/skills/` | Inteligencia táctica y protocolos operativos específicos |
| Templates | `.agent/templates/` | Plantillas maestras para el eje documental |

## Cómo Adoptar Kairós

### En un proyecto nuevo (Greenfield)

1. Clonar o copiar este repositorio como base
2. Ejecutar `/kairos [intención]` en tu primera sesión de chat para establecer el MASTER-SPEC
3. Comenzar a desarrollar — la IA aplicará la gobernanza automáticamente

### En un proyecto existente (Brownfield)

1. Copiar la carpeta `.agent/` y los archivos raíz (`kairos-version.txt`, `README-KAIROS.md`, `.gitignore`) a tu repo
2. Ejecutar `/fix` para auditar la deuda técnica existente
3. Poblar `docs/MASTER-SPEC.md` con el contexto actual del proyecto
4. Ejecutar `/kairos [intención]` para alinear la estrategia actual y continuar.

## Actualización de Kairós

Para actualizar a una nueva versión del sistema de gobernanza sin perder la documentación del proyecto, ejecutar el workflow `/update` en cualquier sesión. El workflow detecta automáticamente cambios en reglas, workflows y skills, y propone las actualizaciones con diffs para aprobación.

## Workflows Disponibles

| Comando | Cuándo usarlo |
| --- | --- |
| `/kairos [intención]` | Al iniciar un proyecto o cuando la dirección estratégica necesita revisión |
| `/kairos` | Auditoría Estratégica: La IA diagnostica el proyecto y propone el siguiente paso de alto impacto |
| `/derive` | Para derivar checks exhaustivos desde cualquier input y sincronizarlos con la documentación |
| `/test` | Para establecer o ejecutar la estrategia de testing |
| `/fix` | Diagnostica y resuelve deuda técnica, errores específicos o áreas de mejora estructural |
| `/document` | Sincroniza el eje documental (MASTER-SPEC, TODO, MEMORY) con el estado real del proyecto |
| `/update` | Para actualizar el sistema de gobernanza Kairós a la última versión |
| `/contain` | Configura la estrategia de entorno de desarrollo (contenedores, máquinas virtuales, etc.) |
| `/release` | Genera una nueva versión oficial del framework (uso exclusivo en repo canónico) |

## Versión

Kairós sigue Semantic Versioning. La versión instalada está en `kairos-version.txt`. Para ver el historial de cambios del sistema de gobernanza, consultar `docs/CHANGELOG.md`.
