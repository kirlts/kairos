# Kairós — Referencia Rápida

> **Versión:** v2.2.0

## Sobre este archivo

Este archivo es parte del sistema de gobernanza Kairós. No es documentación de tu proyecto — es la referencia operativa del framework que asiste a la IA durante el desarrollo.

## Estructura del sistema

| Carpeta | Función |
| --- | --- |
| `.agent/rules/` | Reglas de comportamiento de la IA |
| `.agent/workflows/` | Flujos de trabajo invocables con comandos |
| `.agent/skills/` | Protocolos automáticos activados por contexto |
| `.agent/templates/` | Plantillas para documentos del proyecto |
| `docs/` | Documentación viva del proyecto (MASTER-SPEC, TODO, MEMORY, CHANGELOG, USER-DECISIONS) |

## Comandos

| Comando | Cuándo usarlo |
| --- | --- |
| `/kairos [intención]` | Al iniciar un proyecto o redefinir la dirección estratégica |
| `/kairos` | Para obtener un diagnóstico del estado actual y la siguiente acción de alto impacto |
| `/derive` | Para generar un checklist de verificación exhaustivo desde código o documentación, integrado con MASTER-SPEC y TODO |
| `/checklist` | Para generar un checklist de verificación desde cualquier input, standalone y agnóstico al dominio |
| `/test` | Para definir o ejecutar la estrategia de testing |
| `/fix` | Para diagnosticar y resolver deuda técnica o errores |
| `/document` | Para sincronizar la documentación con el estado real del proyecto |
| `/update` | Para actualizar el sistema de gobernanza a la última versión |
| `/contain` | Para configurar el entorno de desarrollo (contenedores, VMs) |
| `/release` | Para generar una nueva versión oficial del framework (solo repo canónico) |

## Actualización

Ejecuta `/update` en cualquier sesión. El workflow compara tu versión local con la última publicada y propone cambios sin afectar tu documentación de proyecto.

## Versión

`kairos-version.txt` contiene la versión instalada y el manifiesto de archivos del framework.
