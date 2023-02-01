# Actividad 1

|Carnet|Nombre|
|---|---|
|201602694|Javier Oswaldo Mirón Cifuentes|


## ¿Qué es el kernel?

El kernel es el corazón o núcleo de un sistema operativo, este actúa de intermediario entre el software y el hardware. También es el encargado de controlar todos los accesos al procesador y a la memoria, permite controlar los drivers y puede acceder directamente al hardware.

___

## Tipos de Kernel

- Microkernel
    - 
     Se basa en ofrecer las funciones básicas de cada dispositivo, administrando aquello que tenga CPU, memoria e IPC. Esto supone un mayor control de dispositivos. Son más compactos que otro tipo de núcleos, por lo que brindan un conjunto reducido de abstracciones básicas del hardware, lo cual brinda beneficios en cuanto a portabilidad, seguridad y su capacidad para adaptarse.
- Monolíticos
    -
    Se trata de un gran núcleo para todas las tareas del sistema. Es de tipo no modular y puede alcanzar un mayor rendimiento que un microkernel. Los kernel monolíticos deben incorporar códigos que operen con varios dispositivos, canales de interrupción y demás operadores de hardware, por lo que, para realizarle modificaciones se requiere de la compilación del núcleo y reiniciar el sistema.
- Híbridos
    -
    Incluyen un código adicional en el núcleo para que se ejecuten labores más rápidamente. Se puede elegir qué acciones ejecutar en modo usuario, y cuáles en modo supervisor.

## User vs Kernel Mode

### Modo Usuario

Al iniciar una aplicación en modo de usuario, se crea un proceso para la aplicación. El proceso proporciona a la aplicación un espacio de direcciones virtuales privado y una tabla de identificadores privados. Dado que el espacio de direcciones virtuales de una aplicación es privado, una aplicación no puede modificar los datos que pertenecen a otra aplicación. Cada aplicación se ejecuta de forma aislada y, si una aplicación se bloquea, el bloqueo se limita a esa aplicación.

### Modo Kernel

Todo el código que se ejecuta en modo kernel comparte un único espacio de direcciones virtuales. Por lo tanto, un controlador en modo kernel no está aislado de otros controladores y del propio sistema operativo. Si un controlador en modo kernel escribe accidentalmente en la dirección virtual incorrecta, los datos que pertenecen al sistema operativo u otro controlador podrían verse comprometidos. Si se bloquea un controlador en modo kernel, todo el sistema operativo se bloquea.