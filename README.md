## ***Create Instance Azure***
O Projeto tem como objetivo disponibilizar uma maquina Virtual na Azure, onde você consiga realizar as seguintes funções:

  - Create Instance 
  - Start    Instance
  - Stop    Instance

### *Serviço Az*
```
.
├── Makefile
├── README.md
├── service
│   ├── src
│   ├── api
│   │   ├── app
│   │   ├── Notebooks
│   ├── create_vm.json
│   ├── init_script.sh
│   ├── Dockerfile
│   ├── docker-compose.yml
```


----------

#### Inicialização
Comandos para realizar o Build das imagens que serão utilizados.

```bash
make build
```

Comandos para rodar os serviços que serão utilizados.

```bash
make run
```
Comandos para derrubar os containers/serviços que serão utilizados.

```bash
make stop
```

----------

#### Configuração de Variaveis

Para realizar o deploy dessa funcionalidade, será necessário preencher as variaveis do arquivo **docker-compose.yml**, com informações desejadas.  

```bash
environment:
		1. - AZURE_CLI_DISABLE_CONNECTION_VERIFICATION=1
		2. - resourcegroup=NomeProjeto
		3. - vmname=NomeMaquinaVirtual
		4. - user=xxxxxx@hotmail.com.br
		5. - password=xxxxxxxxx
```

**1 - AZURE_CLI_DISABLE_CONNECTION_VERIFICATION:**
Parâmetro para autenticação automática .

**2 - Resource Group:**
Nome do "Grupo de Recursos", que será utilizado na Azure.

**3 - VMName:**
Nome da maquina virtual na Azure.

**4 - User:**
Nome do usuário/conta na Azure.

**5 - Password:**
Senha do usuário/conta na Azure.

Essas informações são essenciais para realizar qualquer tipo de ação no container.  

----------


Obs: Essa solução foi criada para facilitar a comunicação via "az cli", caso não consiga instalar essa ferramenta localmente.
