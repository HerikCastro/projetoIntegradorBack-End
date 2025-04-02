import express from 'express';
import knex from "knex";
const app = express()
app.use(express.json());
const port = 3006

app.get('/', (req, res) => {
  res.send('Olá Mundo!')
})

const mysql2 = knex({
    client: 'mysql',
    connection: {
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: 'senacrs',
      database: 'mounted_style',
    }
  });

app.listen(port, () => {
  console.log(`App de exemplo esta rodando na porta ${port}`)
})