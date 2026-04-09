# Kairós — Sistema de Gobernanza para Desarrollo Asistido por IA

> **Versión:** v2.2.0

## ¿Qué es Kairós?

Kairós es un sistema que estructura la colaboración entre un desarrollador y su IA de codificación. Si usas herramientas como Cursor, Windsurf, Claude Code o Gemini CLI para programar, Kairós se asegura de que la IA mantenga un estándar de calidad profesional en todo lo que produce — código, documentación y decisiones de arquitectura.

**¿Qué problema resuelve?** Sin gobernanza, las IAs de codificación tienden a:
- Generar código genérico que resuelve lo inmediato pero acumula deuda técnica
- Perder contexto entre sesiones, repitiendo errores o contradiciendo decisiones anteriores
- Ser complacientes con tus ideas en lugar de desafiarlas constructivamente

Kairós instala un marco operativo que la IA sigue automáticamente para contrarrestar estas tendencias.

## Cómo funciona

Kairós vive en una carpeta `.agent/` dentro de tu repositorio. Contiene:

| Carpeta | Qué hace |
| --- | --- |
| `.agent/rules/` | Define cómo se comporta la IA: su rigor, su tono, sus límites |
| `.agent/workflows/` | Flujos de trabajo que ejecutas con comandos (`/derive`, `/test`, `/fix`, etc.) |
| `.agent/skills/` | Protocolos especializados que la IA activa automáticamente según el contexto |
| `.agent/templates/` | Plantillas para los documentos que el sistema genera en tu proyecto |

Además, Kairós mantiene un directorio `docs/` en tu proyecto con documentos vivos que se actualizan durante el desarrollo:

| Documento | Para qué sirve |
| --- | --- |
| `MASTER-SPEC.md` | La especificación técnica de tu proyecto — qué se está construyendo y cómo |
| `TODO.md` | Tareas pendientes con trazabilidad hacia la especificación |
| `MEMORY.md` | Lecciones aprendidas que persisten entre sesiones |
| `USER-DECISIONS.md` | Registro de tus decisiones de diseño y el "por qué" detrás de ellas |
| `CHANGELOG.md` | Historial de cambios del proyecto |

## Comandos disponibles

Ejecuta estos comandos en el chat de tu IDE para activar flujos de trabajo específicos:

| Comando | Cuándo usarlo |
| --- | --- |
| `/kairos [intención]` | Al iniciar un proyecto. Establece la especificación técnica y la dirección estratégica |
| `/kairos` | Cuando no sabes qué hacer. La IA diagnostica el estado del proyecto y propone el siguiente paso de alto impacto |
| `/derive` | Cuando necesitas un checklist de verificación exhaustivo para tu código, integrado con la documentación del proyecto |
| `/checklist` | Cuando necesitas un checklist de verificación para cualquier cosa — no solo código. Funciona con documentos, postulaciones, planes de negocio, etc. |
| `/test` | Para definir o ejecutar la estrategia de testing |
| `/fix` | Cuando algo está roto o hay deuda técnica que resolver |
| `/document` | Para sincronizar la documentación con el estado real del código |
| `/update` | Para actualizar Kairós a la última versión sin perder tu documentación |
| `/contain` | Para configurar el entorno de desarrollo (contenedores, VMs, etc.) |
| `/release` | Para generar una nueva versión del framework (solo en el repo oficial de Kairós) |

## Cómo adoptarlo

### En un proyecto nuevo

1. Clona o copia este repositorio como base
2. Ejecuta `/kairos [descripción de tu proyecto]` en tu primera sesión de chat
3. Empieza a desarrollar — la IA aplicará la gobernanza automáticamente

### En un proyecto existente

1. Copia la carpeta `.agent/`, `kairos-version.txt` y `README-KAIROS.md` a tu repositorio
2. Ejecuta `/kairos [descripción de tu proyecto]` para establecer la especificación
3. Opcionalmente, ejecuta `/fix` para auditar la deuda técnica que ya existe

## Actualización

Ejecuta `/update` en cualquier sesión de chat. El workflow detecta automáticamente qué cambió en la nueva versión y te propone las actualizaciones con diffs para tu aprobación. Tu documentación de proyecto no se toca.

## Versión

Kairós sigue [Semantic Versioning](https://semver.org/). La versión instalada está en `kairos-version.txt`.
