# mc536-application

Running:
```
docker compose up
```

Checkout `localhost:8989`

## Endpoints

| method | endpoint | desc |
| ------ | -------- | ---- |
| GET | `/tables/<table_name>` | Provided with query parameters for its attributes, returns query result |
| POST | `/tables/<table_name>` | Provided with required attributes in request body (as json) for insertion, returns the id of the inserted entity|
| PATCH | `/tables/<table_name>/<id>` | Provided with required `<id>` and attributes in request body (as json) to udpate, updates entity with corresponding `<id>` |
| DELETE | `/tables/<table_name>/<id>` | Provided with required `<id>`, deletes entity with corresponding `<id>` |

Available tables:
- entidade_empresa
- entidade_governo
- vaga_emprego
- entidade_pessoa_fisica
- auxilio
- rel_pessoa_busca_auxilio
- rel_pessoa_usa_auxilio

**PRO TIP** - Import `mc536-app.postman_collection.json` to [Postman](https://www.postman.com/) for ready to use http requests
