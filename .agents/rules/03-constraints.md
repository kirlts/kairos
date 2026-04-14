# Restricciones del proyecto

Este archivo registra restricciones del proyecto actual de toda categoría. Funciona como duplicación defensiva de MASTER-SPEC §4, posicionada en el system prompt para sobrevivir a la degradación de contexto en sesiones largas.

## Protocolo de llenado

1. **Desde el usuario:** Restricciones declaradas explícitamente.
2. **Desde MASTER-SPEC:** Restricciones inferidas al definir §4.
3. **Desde la ejecución:** Restricciones descubiertas durante el desarrollo (fricciones recurrentes, incompatibilidades detectadas).

## Formato de entrada

```markdown
### [R-NNN] [Título descriptivo]
**Tipo:** Tecnológica | Negocio | Diseño | Regulatoria | Infraestructura | Organizacional
**Origen:** Explícita (usuario) | Inferida (MASTER-SPEC) | Descubierta (ejecución)
**Restricción:** [Lo que NO se puede hacer y por qué]
**Alternativa aprobada:** [Lo que SÍ se usa en su lugar]
```

## Restricciones activas

*Sin restricciones registradas. Ejecutar `/derive` o definir MASTER-SPEC §4 para establecer restricciones.*
