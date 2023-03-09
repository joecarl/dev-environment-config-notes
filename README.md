# dev-environment-config-notes
Notas para la configuración de diferentes entornos de desarrollo

## Configuracion básica en VS-Code

1. Instalar Notepad++ (recomendado)
1. Instalar GIT 
	* Establecer Notepad++ como editor por defecto en GIT (recomendado)

1. Instalar VS Code
	* En preferencias > Word separator ---> quitar el dolar
	* Settings > Workbench > Appearance > Tree: Indent ---> 18
	* Establecer la consola de GIT (msys2) como consola por defecto 
 


## Trabajar con repositorios de GitHub

1. Crear una carpeta para guardar los repositorios, por ejemplo:

	```
	mkdir repos-myname
	```
	
1. Navegar a esa carpeta desde Git Bash:

	```
	cd repos-myname
	```
1. Clonar el repositorio deseado:

	```
	git clone URL-TO-REPO
	```
	Cambiando `URL-TO-REPO` por la dirección HTTPS del repositorio de GitHub
	
1. Para trabajar con el repositorio lo más fácil es arrastrar la carpeta clonada al icono de VS Code en el escritorio.

	
## Remote developing en VS-Code

1. Instalar el pack de extensiones `Remote Development`
1. Para iniciar sesión con SSH keys, lanzar los siguientes comandos desde Git Bash:

	```
	ssh-keygen -t rsa -b 4096
	``` 
	
	Aceptar todos los prompts por defecto y posteriormente proceder con:
	
	```
	ssh-copy-id -i "$HOME/.ssh/id_rsa.pub" "your-user-name-on-host@hostname"
	```
