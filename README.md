# Kroton API

# Tecnologias

- Java 11
- Kotlin
- Spring Boot
- Intellij
- Maven
- H2
- MySql (AWS RDS) 
- Docker
- Kubernetes (AWS EKS e ECR)
- MockMvc
- OpenApi
- Jenkins

# Arquitetura

Optei por fazer uma arquitetura mais simples, assim como faria no dia a dia se tivesse apenas uma api ou serviço. 
Usei uma controller, service e repository. 

# Banco de dados

Por se tratar de uma api de teste, usei o H2 para os testes unitários e MySql para a aplicação.


## Executando a aplicação

Execute o mvn clean install e depois o spring-boot:run

```
$ mvn clean install -DskipTests=true
```

```
$ mvn spring-boot:run
```

Com a aplicação rodando, vá ao navegador e digite:

```
http://localhost:8080/swagger-ui.html
```

# Como usar

Acessando o Swagger verá que temos um CRUD completo, 
<img width="938" alt="image" src="https://user-images.githubusercontent.com/39627828/228377867-10542cf0-5ce2-49ce-a8cc-3402d2ff73ca.png">

Basta usar o botao "Try it out" para ver o body e fazer as requisiçoes.
<img width="956" alt="image" src="https://user-images.githubusercontent.com/39627828/228378464-fbdc9879-8617-4e77-afe6-4b47ba0f82c7.png">

# Pipeline - Jenkins

Criei uma pipeline local no Jenkins, o arquivo está na raiz do projeto, o Jenkinsfile.
<img width="676" alt="image" src="https://user-images.githubusercontent.com/39627828/228378690-349ae10c-65d8-4ab7-b86d-2e9722329674.png">

Primeiro baixamos o projeto do GitHub, depois compilamos e gerando um jar. Geramos uma imagem docker e mandamos para o AWS ECR. Por fim fazemos deploy no EKS.
<img width="678" alt="image" src="https://user-images.githubusercontent.com/39627828/228379292-4c693918-56aa-4ff2-b607-7cca7ae121c3.png">

Log final da pipeline
<img width="621" alt="image" src="https://user-images.githubusercontent.com/39627828/228379427-ef647255-ea82-40cd-8c51-127fa51c351c.png">

Temos no final um service que nos provê uma url para acessar o serviço.
<img width="761" alt="image" src="https://user-images.githubusercontent.com/39627828/228379667-bcd0f3d6-dc11-47c5-b3a0-f582673a9dc7.png">

Acessando no navegador ficaria assim.
<img width="832" alt="image" src="https://user-images.githubusercontent.com/39627828/228379916-5e4213ec-1828-4c23-9c62-65aa2a42b602.png">

