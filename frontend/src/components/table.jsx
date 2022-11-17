import React from 'react'

const auxiliosPrint = ['ID', 'Valor Mensal', 'Duracao Meses']
const auxiliosFields = ['id', 'valor_mensal', 'duracao_meses']
const pessoasPrint = ['ID', 'Nome', 'CPF', 'E-mail', 'Federação', 'Renda Familiar', 'Vaga Emprego']
const pessoasFields = ['id', 'nome', 'cpf', 'email', 'federacao', 'renda_familiar', 'vaga_emprego']

export default function Table({ type, data }) {
  if (type === 'auxilios')
    return (
      <table>
        <tr>
          {auxiliosPrint.map((header) => (
            <th>{header}</th>
          ))}
        </tr>
        {data.map((auxilio) => (
          <tr>
            {auxiliosFields.map((field) => (
              <td>{auxilio[field]}</td>
            ))}
          </tr>
        ))}
      </table>
    )
  else if (type === 'pessoas')
    return (
      <table>
        <tr>
          {pessoasPrint.map((header) => (
            <th>{header}</th>
          ))}
        </tr>
        {data.map((pessoa) => (
          <tr>
            {pessoasFields.map((field) => (
              <td>{pessoa[field]}</td>
            ))}
          </tr>
        ))}
      </table>
    )
}
