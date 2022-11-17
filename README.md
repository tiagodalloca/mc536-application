# mc536-application

Running:
1. Download the repository & [Postman](https://www.postman.com/downloads/) (there's no need for an account);
2. Open the command line and go into the project's folder;
3. Type the following command:
```
docker compose up
```
4. Wait for this message:
```
ready for connections. Version: '8.0.31'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
```
5. Run Postman
6. Import the project into Postman
![print_exemplo_02](https://user-images.githubusercontent.com/20073691/202284870-b2807f6e-8ba3-4558-9ed5-e34fc003b47e.png)
7. Now you can do any request to select/insert/remove/update any table
![print_exemplo_01](https://user-images.githubusercontent.com/20073691/202285040-6eb3b449-c1fb-4d27-8b51-9109b7f3953c.png)
*The purple square defines the type of request you want, the orange square contains the table to be analyzed, the green square defines the necessary information in the request's body, the blue square contains the result after sending the request*

Checkout `localhost:8989`

## Endpoints

| method | endpoint | desc |
| ------ | -------- | ---- |
| GET | `/tables/<table_name>` | Provided with query parameters for its attributes, returns query result. If no query parameter is provided, returns all available entities. |
| POST | `/tables/<table_name>` | Provided with required attributes in request body (as json) for insertion, returns the id of the inserted entity|
| PATCH | `/tables/<table_name>/<id>` | Provided with required `<id>` and attributes in request body (as json) to udpate, updates entity with corresponding `<id>` |
| DELETE | `/tables/<table_name>/<id>` | Provided with required `<id>`, deletes entity with corresponding `<id>` |

Available tables:
- `entidade_empresa`
- `entidade_governo`
- `vaga_emprego`
- `entidade_pessoa_fisica`
- `auxilio`
- `rel_pessoa_busca_auxilio`
- `rel_pessoa_usa_auxilio`

**PRO TIP** - Import `mc536-app.postman_collection.json` to [Postman](https://www.postman.com/) for ready to use http requests
