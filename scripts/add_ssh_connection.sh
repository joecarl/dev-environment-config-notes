echo "Introduzca su authority <user>@<host-or-ip> (e.g.: pedro@10.20.30.40)"
echo -n ">: "
read authority
#your-user-name-on-host@hostname

RSA_FILE="$HOME/.ssh/id_rsa"
SSH_CONFIG_FILE="$HOME/.ssh/config"

if [[ ! -f "$RSA_FILE" ]]; then 
	ssh-keygen -t rsa -b 4096 -f "$RSA_FILE" -N ""; 
else 
	echo "Key ya existente. Omitiendo..."
fi

port="22"
user=""
host=""

# Extraer usuario, host y puerto si está presente
if [[ "$authority" =~ ^([^@:]+)@([^@:]+):([0-9]+)$ ]]; then
    user="${BASH_REMATCH[1]}"
    host="${BASH_REMATCH[2]}"
    port="${BASH_REMATCH[3]}"
elif [[ "$authority" =~ ^([^@:]+)@([^@:]+)$ ]]; then
    user="${BASH_REMATCH[1]}"
    host="${BASH_REMATCH[2]}"
fi

echo ""
echo "== Configurando acceso SSH para: ======"
echo "="
echo "= Usuario: $user"
echo "= Host: $host"
echo "= Puerto: $port"
echo "======================================="
echo ""

ssh-copy-id -i "$RSA_FILE.pub" -p "$port" "$user@$host"

if [[ $? -eq 0 ]]; then

	ssh_host="$host($user)"

	# Verificar si el host ya está en ~/.ssh/config
	if ! grep -qE "^Host $ssh_host\$" "$SSH_CONFIG_FILE" 2>/dev/null; then
		{
			echo -e "\nHost $ssh_host"
			echo "    HostName $host"
			echo "    User $user"
			echo "    Port $port"
		} >> "$SSH_CONFIG_FILE"
		
		echo "Host $ssh_host agregado a $SSH_CONFIG_FILE"
	else
		echo "El host $ssh_host ya existe en $SSH_CONFIG_FILE"
	fi


	echo "** Finalizado con éxito! **"
else
	echo "** ERROR. POR FAVOR REVISE LAS CREDENCIALES INTRODUCIDAS. **"
fi

echo "Presione cualquier tecla para terminar"
read -n1
