Punto 1:A)¿Qué se puede notar con respecto al tiempo de ejecución? ¿Es
predecible?


 Tiempo(sinhilos.py): (1) 5.43 , (2) 5.42 , (3) 5.42 , (4) 5.42 , (5) 5.42 , (6) 5.42 , (7) 5.42 , (8) 5.42 , (9) 5.43 , (10) 5.41 
 
 Tiempo (conhilos.py) : (1) 4.02 , (2) 4.01 , (3) 4.03 , (4)4.03 , (5) 4.01 , (6) 4.01 , (7)- 4.02 


 RTA: Lo que puedo notar con respecto al tiempo de ejecucion es que el codigo (conhilos.py) tiene un tiempo levemente mas rapido al correr que el codigo (sinhilos.py). Estos puede ser predecibles al correrse en un dispositivo unico, ya que al correrse en un PC diferente varia el tiempo de ejecuccion.




 b) Comparar con un campañero el tiempo de ejecución. ¿Son iguales?.

 Rta: Compare los tiempos con una compañera y estos no son iguales. El archivo (SinHilos.py) en el PC de mi compañera rondan entre 5.14 / 5.24 segundos y en mi PC entre 5.41 / 5.43 tieniendo una leve diferencia entre nuestras computadoras, Pero en el archivo (conhilos.py) nos dio tiempos iguales con un promedio de entre 4.01 / 4.03.



 c) Ejecutar el archivo suma_rasta.py unas 10 veces, luego descomentar ,(borrar el #) las líneas 11,12,19 y 20 guardarlo y ejecutarlo otras 10 veces. ¿Qué pasó? ¿Por qué?.

 RTA: (Sin Descomentar) el archivo se ejecuta bastante rapido con un promedio de 0.24 seg, a diferencia al codigo (descomentado) el cual ahora tarda mucho mas que el anterior con un promedio de 7 segundos, comparado al aterior se volvio mas pesado y lento, ya que se le agrego nuevas intrucciones al codigo el cual hace recorrer un rango entre numeros el cual relentiza el programa al ejecutarlo.





 2 ) A)
 
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20
int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;


 void *comer_hamburguesa(void * tid)
{
    while (1 == 1)
    { 
        while(turno!=(int)tid);

    // INICIO DE LA ZONA CRÍTICA
        if (cantidad_restante_hamburguesas > 0)
        {
            printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
            cantidad_restante_hamburguesas--; // me como una hamburguesa
        }
        else
        {
            printf("SE TERMINARON LAS HAMBURGUESAS  \n");

            pthread_exit(NULL); // forzar terminacion del hilo
        }
    // SALIDA DE LA ZONA CRÍTICA
        turno = (turno + 1)% NUMBER_OF_THREADS;


    }
}

int main(int argc, char argv[])
{
    pthread_t threads[NUMBER_OF_THREADS];
    int status, i, ret;
    for (int i = 0; i < NUMBER_OF_THREADS; i++)
    {
        printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
        status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
        if (status != 0)
        {
            printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
            exit(-1);
        }
    }

    for (i = 0; i < NUMBER_OF_THREADS; i++)
    {
        void *retval;
        ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
    }
    pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}



2) B)
   ![DiagramaHamburguesas](https://github.com/JulianRipa/ASO2024TPs/assets/167567929/58973c53-d32f-4fdf-ae12-5a73106a219a)

