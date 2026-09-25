package main

import (
	"io"
	"net/http"
	"os"
	"fmt"
	"bytes"
)

func main() {


	//resp, _ := http.Get("https://stackoverflow.com/questions/44785585/how-can-i-delete-all-local-docker-images")
	resp, _ := http.Get("https://whackahack.com/juegos/?language=es&complete=1")
	bodyBytes, _ := io.ReadAll(resp.Body)

	previousBytes, err := os.ReadFile("/data/page.html") // leo el anterior
	
	if os.IsNotExist(err) { // es la primera vez
	    fmt.Println("Primera ejecución: No hay versión previa por lo que se guarda el archivo inicial...")
	    os.WriteFile("/data/page.html", bodyBytes, 0644) // herramienta que usaremos mas tarde
	    
	} else if err != nil { // en caso de error
	    fmt.Println("Error al leer el archivo:", err)
	    return
	    
	} else { // toca comparar pues existe
	    if bytes.Equal(previousBytes, bodyBytes) {
	        fmt.Println("La página sigue igual") // no cambios
	    } else {
	        fmt.Println("La página ha cambiado")
	        os.WriteFile("/data/page.html", bodyBytes, 0644) //guardamos cambios
	    }
	}
}

